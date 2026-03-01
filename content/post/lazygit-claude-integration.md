# Lazygit 自定义命令集成 Claude Code 实践指南

## 背景

在日常开发中，我使用 Lazygit 作为 Git 的 TUI 工具，同时使用 Claude Code 作为 AI 编程助手。为了提升工作流效率，我希望在 Lazygit 中直接通过快捷键切换分支并启动 Claude Code，避免手动操作。

## 目标

实现两个工作流：
1. **Tmux 工作流**：在 branches 视图按 `A` → 切换分支并在新 tmux 窗口启动 Claude
2. **Claude Code 工作流**：在 branches 视图按 `C` → 切换分支并在当前终端启动 Claude Code

## 踩过的坑

### 1. 命令链接 `&&` 不工作

**问题**：最初尝试直接使用 `&&` 连接命令：
```yaml
command: 'git checkout "{{.SelectedLocalBranch.Name}}" && claude'
```

**原因**：Lazygit v0.50.0+ 不使用交互式 shell，`&&` 被当作字面参数而非 shell 操作符。

**解决方案**：使用 `sh -c` wrapper（但后来发现对于简单的 `&&` 链接，Lazygit 实际上支持直接使用）。

### 2. Tmux 命令语法错误

**问题**：使用 YAML 多行字符串 `>` 导致命令被错误拆分：
```yaml
command: >
  tmux new-window -c "{{.SelectedWorktree.Path}}"
  -n "agent" "claude --print '请完成该分支的任务' "
```

**原因**：YAML 的 `>` 会将换行转换为空格，导致 tmux 将 `"claude ..."` 当作窗口名称参数。

**解决方案**：使用单行命令：
```yaml
command: 'tmux new-window -c "{{.SelectedWorktree.Path}}" -n "agent" claude'
```

### 3. `--trust` 参数不存在

**问题**：尝试使用 `claude --trust` 跳过信任对话框，但该参数不存在。

**解决方案**：使用正确的参数 `--permission-mode bypassPermissions`。

### 4. 模板函数 `replace` 不支持

**问题**：尝试使用 `{{.SelectedLocalBranch.Name | replace "/" "-"}}` 替换分支名中的斜杠。

**原因**：Lazygit 的 Go 模板引擎不支持 `replace` 函数。

**解决方案**：
- 方案 1：使用 shell 字符串替换 `${BRANCH//\//-}`
- 方案 2：简化需求，不需要路径转换（最终采用）

### 5. `{{.RepoName}}` 变量不可用

**问题**：在 `localBranches` context 中使用 `{{.RepoName}}` 报错。

**原因**：该变量在 `localBranches` context 中不存在。

**解决方案**：移除对 `{{.RepoName}}` 的依赖，简化路径构造。

### 6. Git Worktree 限制

**问题**：尝试为当前已 checkout 的分支（如 `main`）创建 worktree 失败：
```
fatal: 'main' is already used by worktree at '/Users/xxx/Code/xxx'
```

**原因**：Git 不允许同一个分支被多个 worktree 使用。

**解决方案**：放弃 worktree 方案，改为直接 checkout 分支。这更简单直接，适合大多数场景。

## 最终配置

```yaml
customCommands:
  # Tmux 工作流
  - key: "A"
    description: "Checkout branch & start Claude in tmux"
    command: 'git checkout "{{.SelectedLocalBranch.Name}}" && tmux new-window -n "agent" claude --permission-mode bypassPermissions'
    context: "localBranches"
    prompts: []

  - key: "A"
    description: "Start Claude Agent in worktree (tmux)"
    command: 'tmux new-window -c "{{.SelectedWorktree.Path}}" -n "agent" claude --permission-mode bypassPermissions'
    context: "worktrees"

  # Claude Code 工作流
  - key: "C"
    description: "Checkout branch & open in Claude Code"
    context: "localBranches"
    command: 'git checkout "{{.SelectedLocalBranch.Name}}" && claude --permission-mode bypassPermissions'
    prompts: []

  - key: "C"
    description: "Open worktree in Claude Code"
    context: "worktrees"
    command: 'claude --permission-mode bypassPermissions "{{.SelectedWorktree.Path}}"'
    prompts: []
    loadingText: "Opening in Claude Code..."
```

## 关键学习点

### 1. Lazygit 模板系统

Lazygit 使用 Go 的模板语法，但功能有限：
- ✅ 支持基本变量：`{{.SelectedLocalBranch.Name}}`、`{{.SelectedWorktree.Path}}`
- ✅ 支持 `quote` 过滤器：`{{.SelectedFile.Name | quote}}`
- ❌ 不支持 `replace` 等字符串操作函数
- ⚠️ 不同 context 下可用变量不同（如 `{{.RepoName}}` 仅在某些 context 可用）

**最佳实践**：
- 优先使用简单的模板变量
- 需要复杂字符串处理时，使用 shell 脚本
- 查阅 [Lazygit 文档](https://github.com/jesseduffield/lazygit/blob/master/docs/Custom_Command_Keybindings.md) 确认可用变量

### 2. Tmux 命令语法

`tmux new-window` 的正确语法：
```bash
tmux new-window [-c start-directory] [-n window-name] [shell-command]
```

**注意事项**：
- 命令参数不需要额外引号包裹（除非命令本身包含空格）
- 使用 YAML 单行字符串而非多行 `>`，避免换行导致的参数解析问题

### 3. Claude Code 权限模式

跳过工作区信任对话框的方法：
- ✅ `--permission-mode bypassPermissions`：跳过所有权限检查
- ✅ `-p` 或 `--print`：非交互模式（自动跳过信任对话框）
- ❌ `--trust`：不存在此参数

**安全提示**：`bypassPermissions` 会跳过所有安全检查，仅在信任的代码库中使用。

### 4. 简化优于复杂

最初的设计是创建 worktree 以实现工作隔离，但遇到了：
- 路径构造复杂（需要处理分支名中的 `/`）
- 模板变量限制（`{{.RepoName}}` 不可用）
- Git 限制（当前分支无法创建 worktree）

**最终方案**：直接 checkout 分支
- ✅ 简单直接，无需复杂的路径处理
- ✅ 适用于所有分支（包括当前分支）
- ✅ 符合大多数开发场景的需求

**教训**：在工具集成时，优先选择简单可靠的方案，而非追求完美但复杂的设计。

### 5. 调试技巧

在配置 Lazygit 自定义命令时：
1. **先在终端测试命令**：确保命令本身可以正常执行
2. **逐步简化**：从最简单的命令开始，逐步添加功能
3. **查看错误信息**：Lazygit 会显示详细的错误信息，仔细阅读
4. **查阅文档**：确认模板变量和函数的可用性

## 使用效果

配置完成后，工作流变得非常流畅：

1. **快速切换分支并启动 AI 助手**：
   - 在 Lazygit branches 视图
   - 选择目标分支
   - 按 `C` → 自动切换分支并启动 Claude Code
   - 无需手动输入命令，无需确认信任对话框

2. **Worktree 支持**：
   - 对于已存在的 worktrees
   - 在 worktrees 视图按 `C` → 直接在该 worktree 中启动 Claude Code

3. **Tmux 集成**：
   - 按 `A` 在新 tmux 窗口启动 Claude
   - 适合需要多窗口并行工作的场景

## 总结

这次配置过程虽然遇到了不少问题，但最终实现了一个简洁高效的工作流。关键收获：

1. **理解工具的限制**：每个工具都有其设计边界，不要强行使用不支持的功能
2. **简化优于复杂**：简单的方案往往更可靠、更易维护
3. **迭代优化**：从最简单的版本开始，逐步优化
4. **文档是最好的朋友**：遇到问题时，先查阅官方文档

希望这篇文章能帮助你更好地配置 Lazygit 和 Claude Code 的集成！

## 参考资源

- [Lazygit Custom Commands 文档](https://github.com/jesseduffield/lazygit/blob/master/docs/Custom_Command_Keybindings.md)
- [Lazygit Custom Commands Compendium](https://github.com/jesseduffield/lazygit/wiki/Custom-Commands-Compendium)
- [Claude Code CLI 文档](https://code.claude.com/docs/en/cli-reference)
- [Tmux 手册](https://man.openbsd.org/tmux)

---

*本文记录于 2026-03-01，基于 Lazygit v0.50.0+ 和 Claude Code 最新版本。*
