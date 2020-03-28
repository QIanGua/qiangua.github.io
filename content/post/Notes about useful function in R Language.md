+++
title = "Notes about useful packages and functions in R Language"
author = ["Qiangua"]
lastmod = 2020-03-28T17:29:26+08:00
tags = ["R"]
draft = false
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


### janitor {#janitor}

-   comment style


### httr {#httr}

Use GET() function to connect with website and get data from it.


## Tips {#tips}


### never use these two commands in the head of R script {#never-use-these-two-commands-in-the-head-of-r-script}

-   first (inseted use here::here())

<!--listend-->

```r
setwd("**/**/**")
```

-   second

<!--listend-->

```r
rm(list = ls())
```

Don't try to change the .Rprofile and affect the data


### check the loaded packages {#check-the-loaded-packages}

```R
(.packages())
```


### set the working directory {#set-the-working-directory}

```R
setwd()
```

I custom the shortcuting in R with ****Cmd+Shift+H****.


### tidy code's formatation {#tidy-code-s-formatation}

Here I just introduce the tidy method in RStudio.

1.  select the region, e.g. ****Cmd + A****
2.  print shortcuting ****Cmd + Shift + A**** to format the code or run ****style active file**** in addin


### get file's path {#get-file-s-path}

```R
full_path <- normalizePath(file_eg)
dir_name<-dirname()
file_name<-basename()
```


## Run R Code {#run-r-code}

<a id="code-snippet--R code block"></a>
```R
library("ggplot2")
ggplot(mpg) + geom_point(aes(x = displ, y = hwy, colour = cty, size = cty))
```

{{< figure src="/ox-hugo/test2.png" >}}