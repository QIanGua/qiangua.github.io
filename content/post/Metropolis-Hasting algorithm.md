---
title: Metropolis-Hasting algorithm
date: 2017-10-03
tags: [physics, algorithm]
categories: Physics
author: 采采流水

---

# Metropolis-Hasting algorithm

[TOC]

## 0. 预备知识



## 1.Monte carlo simulation



## 2. Metropolis-Hasting algorithm

由於簡單抽樣存在效率低、在構象空間以等概率遍歷抽樣的缺點，重要性抽樣是針對此進行改進的抽樣方法。從物理圖像來想，系統的構型空間雖然很大，但是處於各個能量狀態的概率是不同的，對於正則系綜，系統處於各個能量狀態的概率分佈遵循玻尓兹曼分佈，處於能量低的狀態具有更大的概率：

$$ p(E_j)=\frac{\exp(-\beta E_j)}{\sum_j\exp(-\beta E_j)}=\frac{1}{\mathcal{Z}}\exp(-\beta E_j)$$

 Metropolis 算法就是基於此實現抽樣的一個有效算法。

> **Metropolois-Hasting Algorithm**
>
> ---
>
> Initialize $x^{(0)}$ randomly
>
> **for** i=0 to N-1 do
>
> ​       Sample $u\sim U[0,1]$ 
>
> ​       Sample $x^*\sim U[0,1]$
>
> ​       **if**  $u<A(x^\ast,x^{(i-1)})=min\left\{1,\frac{p(x^\ast)q(x^{(i)}|x^\ast)}{p(x^{(i)})q(x^{(i)})}\right\}$ **then**
>
> ​           $x^{(i+1)}=x^\ast$
>
> ​      **else**
>
> ​           $x^{(i+1)}=x^{(i)}$
>
> ​     **end if**
>
> **end for**
>
> ---



## **3**. Application

### 3.1 Two-Dimension Ising model

为了避免臃肿，还是单独另起一篇吧>smile<。

