+++
title = "Writing Hugo blog in Org"
date = 2019-11-19T02:10:00+08:00
lastmod = 2019-11-19T16:07:57+08:00
tags = ["org"]
draft = false
author = "Qiangua"
+++

-   State "DONE"       from "TODO"       <span class="timestamp-wrapper"><span class="timestamp">[2019-11-19 Tue 02:10]</span></span>


## Heading {#heading}

This post will be exported ad `content/posts/writing-hugo-blog-in-org-subtree-export.md`.


## Code fragment {#code-fragment}

{{< highlight latex >}}
\#+BEGIN_SRC latex
  f=ma
\#+END_SRC
{{< /highlight >}}


## Math formula {#math-formula}


### Inline math {#inline-math}

This is a inline math formula \\(f=ma\\).


### Online math {#online-math}

This is a online math formula,

\begin{equation}
\label{eq:1}
C = W\log\_{2} (1+\mathrm{SNR})
\end{equation}

\\[ S = k\_{B}T\log\Omega \\]


## Insert figures {#insert-figures}

With the assistance of `org-download`, it's convient to insert a figure in org file, e.g.

{{< figure src="/ox-hugo/photo-1574003887216-5d32ce5f22fa_2019-11-19_15-26-30.jpeg" >}}