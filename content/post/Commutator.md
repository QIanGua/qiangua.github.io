---
title: 量子力学常见对易关系
date: 2015-09-16
tags: Quantum
---

# 量子力学常见对易关系及其证明

标签（空格分隔）：  Quantum Comumutor 

[TOC]

---
## 基本对易关系

$$
\begin{equation}
[X_{\alpha},P_{\beta}]=i\hbar
\label{eq:1}
\end{equation}
$$

$$
\begin{equation}
[AB,C]=A[B,C]+[A,C]B
\end{equation}
$$

$$
\begin{align}
[A,f(B)]&=\frac{\partial f}{\partial B}[A,B]\\
[f(A),B]&=-\frac{\partial f}{\partial A}[A,B]
\label{eq:2}
\end{align}
$$

根据 Eq.~(2) 可推出

$$
\begin{align}
[X,f(P)]&=-i\hbar\frac{\partial f}{\partial P}\\
[f(X),P]&=i\hbar\frac{\partial f}{\partial X}\\
[A,B^n]&=n B^{n-1} [A,B]
\label{eq:3}
\end{align}
$$

## 常见力学量的对易关系
- 角动量   （$J,J^2$）
- 升降算符 （$J_{\pm},a^+,a$）
- 自旋算符  ($\sigma_x,\sigma_y,\sigma_z$)

**角动量**：

$$
\begin{align*}
[J_{\alpha},X_{\beta}]&=i\hbar\varepsilon_{\alpha\beta\gamma}X_{\gamma}\\
[J_{\alpha},P_{\beta}]&=i\hbar\varepsilon_{\alpha\beta\gamma}P_{\gamma}\\
[J^{2},J_{\alpha}]&=0\\
\end{align*}
$$

**下面证明**：
$$
\begin{align*}
[J_{z},J_{\pm}]&= [J_{z},J_{x}\pm i J_{y}] \\
               &= [J_{z},J_{x}]+[J_{z},\pm i J_{y}] \\
               &= i\hbar J_{y}\pm i[J_{z}, J_{y}] \\
               &= i\hbar J_{y}\pm i(-i\hbar J_{x}) \\
               &= i\hbar J_{y}\pm\hbar J_{x} \\
               &= \pm\hbar J_{\pm}
\end{align*}
$$

**升降算符**：

谐振子的哈密顿量为：

$$
\begin{align*}
H=\hbar \omega(\frac{1}{2}+a^+a)\\
\end{align*}
$$

$$
\begin{align*}
a|n\rangle&=\sqrt{n}|n-1\rangle\\
a^+|n\rangle&=\sqrt{n+1}|n+1\rangle
\end{align*}
$$
