+++
title = "Deploy Hugo blog on Netlify"
date = 2019-11-20T00:21:00+08:00
lastmod = 2019-11-23T21:33:52+08:00
tags = ["blog", "netlify"]
draft = false
author = "Qiangua"
+++

-   State "DONE"       from "TODO"       <span class="timestamp-wrapper"><span class="timestamp">[2019-11-20 Wed 00:21]</span></span>

General introduction of several problems I got during the process I deploy hugo blog on Netlify.


## First Issue: Can't recognize submodule's position {#first-issue-can-t-recognize-submodule-s-position}

The blog theme is added by using git submodule, such as `git submodule add origin url`. Remember the url of theme repo to use `https` instead of `git`.


## Second Issue: Command not found and continue publishing {#second-issue-command-not-found-and-continue-publishing}

Now that I use hugo to generate the blog publish file, so it's necessary to set GO environment in Netlify's machine.
All you need to do is to customize deployment setting environment:

-   Build command: hugo
-   Publish directory: publish

More details to check this link: <https://docs.netlify.com/configure-builds/common-configurations/#gatsby>


## Third Issue: Clear the cache and redeploy {#third-issue-clear-the-cache-and-redeploy}

If everything seems fine, but your blog is still not display normally. Maybe you need to clear out the cache and redeploy on the Netlify.