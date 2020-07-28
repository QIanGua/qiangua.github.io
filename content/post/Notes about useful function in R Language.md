+++
title = "Notes about useful packages and functions in R Language"
author = ["Qiangua"]
lastmod = 2020-03-29
tags = ["R"]
draft = false
+++

In this post, I will record some common R's packages and functions.

<!--more-->


## <span class="section-num">1</span> Packages {#packages}


### <span class="section-num">1.1</span> ggplot2 {#ggplot2}


### <span class="section-num">1.2</span> data.table {#data-dot-table}


### <span class="section-num">1.3</span> tidyverse {#tidyverse}


### <span class="section-num">1.4</span> magritter {#magritter}


### <span class="section-num">1.5</span> patchwork {#patchwork}


### <span class="section-num">1.6</span> fs {#fs}


### <span class="section-num">1.7</span> rvest {#rvest}


### <span class="section-num">1.8</span> purr {#purr}


### <span class="section-num">1.9</span> drake {#drake}

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


### <span class="section-num">1.10</span> janitor {#janitor}

-   comment style


### <span class="section-num">1.11</span> httr {#httr}

Use GET() function to connect with website and get data from it.


### <span class="section-num">1.12</span> V8 {#v8}


## <span class="section-num">2</span> Tips {#tips}


### <span class="section-num">2.1</span> never use these two commands in the head of R script {#never-use-these-two-commands-in-the-head-of-r-script}

-   first (instead use here::here())

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


### <span class="section-num">2.2</span> check the loaded packages {#check-the-loaded-packages}

```R
(.packages())
```


### <span class="section-num">2.3</span> set the working directory {#set-the-working-directory}

```R
setwd()
```

I custom the shortcuting in R with ****Cmd+Shift+H****.


### <span class="section-num">2.4</span> tidy code's formatation {#tidy-code-s-formatation}

Here I just introduce the tidy method in RStudio.

1.  select the region, e.g. ****Cmd + A****
2.  print shortcuting ****Cmd + Shift + A**** to format the code or run ****style active file**** in addin


### <span class="section-num">2.5</span> get file's path {#get-file-s-path}

```R
full_path <- normalizePath(file_eg)
dir_name<-dirname()
file_name<-basename()
```


### <span class="section-num">2.6</span> insert and run R chunck in Rmarkdown {#insert-and-run-r-chunck-in-rmarkdown}

insert: ****Cmd+Opt+i****
run: ****Cmd+Shift+enter****


## <span class="section-num">3</span> Run R Code {#run-r-code}

\\[f=ma\\]

<a id="code-snippet--R code block"></a>
```R
library("ggplot2")
ggplot(mpg) + geom_point(aes(x = displ, y = hwy, colour = cty, size = cty))
```

{{< figure src="/ox-hugo/test2.png" >}}