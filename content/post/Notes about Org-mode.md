+++
title = "Notes about Org-mode"
author = ["Qiangua"]
lastmod = 2020-03-21
tags = ["org-mode"]
draft = true
+++

I will record some useful org-mode skills here.

<!--more-->


## <span class="section-num">1</span> Title and Folding {#title-and-folding}


## <span class="section-num">2</span> Format {#format}

-   粗体

**加粗测试** 成功

-   下劃線

<span class="underline">下劃線</span> 成功

-   删除線

~~刪除線~~ 成功

-   斜体

_斜体_ 成功

-   引用塊 **<q+tab**

> 衆里尋他遷百度，驀然回首，那人卻在燈火闌珊处

-   示例塊

<!--listend-->

```text
#+begin_quote
引用测试
#+end_quote
```


## <span class="section-num">3</span> Insert code block {#insert-code-block}

Some code block lists:

-   latex

<!--listend-->

```text
#+BEGIN_SRC latex
E = mc^2
#+END_SRC
```

-   R

<!--listend-->

```text
#+BEGIN_SRC R
library(ggplot2)
getwd()
#+END_SRC
```

-   Python

<!--listend-->

```text
#+BEGIN_SRC python
import httr
import numpy as np
#+END_SRC
```

-   matlab

<!--listend-->

```text
#+BEGIN_SRC matlab
clear all;
pwd
#+END_SRC
```

-   shell

<!--listend-->

```text
#+BEGIN_SRC shell
pwd
ls
#+END_SRC
```