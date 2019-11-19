---
title: Spectral Density Function
date: 2018-03-01
tags: Physics
---



# 谱函数截断 之 关联函数图像

[TOC]

## 1.简明定义

谐振子热库的关联函数：
$$
C(t) = \frac{1}{\pi} \int_0^{\infty} J(\omega)\left[ \coth \frac{\beta\omega}{2}\cos \omega t - i \sin \omega t\right] \, d\omega,
$$
谱密度函数：
$$
J(\omega) = \frac{\pi}{2}\sum_j \frac{c_j^2}{\omega_j}\delta(\omega-\omega_j).
$$
这里我们只关注其指数形式：
$$
 J(\omega)=\frac{\pi}{2}\alpha\omega^s\omega_c^{1-s}f(\frac{\omega}{\omega_c}),
$$
$f(\omega/\omega_c)$ 是截断函数，因为高频部分必然会衰减趋于零。



## 2. 两种截断方式

针对谱函数做两种截断处理。

### 2.1 有理分式截断

$$
f(x=\frac{\omega}{\omega_c})=\frac{1}{(1+x^2)^{-2}}
$$



### 2.2 指数衰减截断


$$
f(x=\frac{\omega}{\omega_c})=\mathcal{e}^{-x}
$$




## 3. 函数图像

还是先用 **Mathematica** 画出来看看，最后用 **Origin** 画细致一点。

需要先对 $\alpha$ 赋值。



![](https://ws3.sinaimg.cn/large/006tNc79gy1foy8l76ou0j311z0e775i.jpg)

红线表示 Rational fraction cutoff

蓝线表示 Exponential cutoff

实线表示实部

点线表示虚部