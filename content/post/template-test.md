+++
title = "Template for Hugo Post"
author = ["Qiangua"]
lastmod = 2019-12-24T14:56:16+08:00
tags = ["hugo"]
draft = true
+++

Template for hugo post

<!--more-->

A yasnippet template is shown below:

```org

# -*- mode: snippet -*-
# name: hugo-post-template
# key: post
# --

#+HUGO_BASE_DIR: ~/Code/Github/blog-hugo
#+HUGO_SECTION: post

#+HUGO_WEIGHT: auto
#+HUGO_AUTO_SET_LASTMOD: t

#+TITLE: 标题

#+HUGO_TAGS: 标签
#+HUGO_DRAFT: true

摘要

#+hugo: more

正文

* Footnotes
* COMMENT Local Variables                          :ARCHIVE:
# Local Variables:
# org-hugo-auto-export-on-save: t
# End:

```