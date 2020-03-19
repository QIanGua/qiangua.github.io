+++
title = "Notes about useful packages and functions in R Language"
author = ["Qiangua"]
lastmod = 2020-03-16T21:45:21+08:00
tags = ["R"]
draft = true
+++

In this post, I will record some common R's packages and functions.

<!--more-->


## Packages {#packages}


### data.table {#data-dot-table}


### tidyverse {#tidyverse}


### magritter {#magritter}


### patchwork {#patchwork}


### fs {#fs}


### rvest {#rvest}


### purr {#purr}


### drake {#drake}

1.  drake\_plan(): create a workflow data frame
2.  make(): build your project
3.  vis\_drake\_graph(): show an interactive visual network representation of your workflow
4.  drake\_history(): show what you built, when you built in, and the function arguments you used
5.  loadd(): load one or more built targets into your R session
6.  readd(): read and return a built target
7.  outdated(): see which targets will be built in the next make()
8.  deps(): check the dependencies of a command or function
9.  failed(): list the targets that failed to build in the last make()
10. diagnose(): return the full context of a build, including errors, warnings, and messages


## Tips {#tips}


### check the loaded packages {#check-the-loaded-packages}

```R
(.packages())
```


### set the working directory {#set-the-working-directory}

```R
setwd()
```

I custom the shortcuting in R with ****Cmd+Shift+H****.