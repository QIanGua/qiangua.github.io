---
title: The simulation of two dimension Ising model
date: 2018-01-16
tags: ["Monte carlo", "Ising model"]
categories: ["Physics"]
---

## 1.模型简述

伊辛模型是用来研究固体磁性最为重要的模型之一，而昂萨格(Onsager)于1944年对二维伊辛模型的解析解的发现则标志着统计物理的新篇章。

一个由$N$个固定点构成的$S$维规则磁性点阵，每个点上放置一个自旋向上或向下的粒子。整个系统的状态由序列$\mathcal{\sigma}=\left(\sigma_1,\sigma_2,\dots,\sigma_N\right)$来表征，每个自旋方向为向上或者向下：
$$
\sigma_i =\{1,-1\}
$$

下图是用 **Mathematica**  作出的一个图示：

<center>![2D Ising Model](http://upload-images.jianshu.io/upload_images/26717-40c92a2ca8f6d4eb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240 "二维伊辛模型示意图")</center>

系统的哈密顿量(可理解为能量)：
$$
H_N\left( \mathcal{\sigma} \right) = -\sum_{\langle i,j\rangle}J_{ij}\sigma_i\sigma_j - \sum_{i=1}^N h_i \sigma_i
$$
其中，$J_{ij}$为耦合常数， 表示$\sigma_i$ 和$\sigma_j$ 之间的耦合强度，$h_i$ 是外磁场强度。

为了简化模拟过程，一般选取$J_{i,j}=J, h_i=0$。 

在正则系综情况下，系统处于某一构型的概率服从玻尔兹曼分布：
$$
P_\sigma^{B}=\frac{\exp(-H(\sigma)\beta)}{\mathcal{Z}}
$$
其中 $\mathcal{z}$ 是配分函数，
$$
\mathcal{z}=\sum_{\sigma} e^{-\beta H(\sigma)}
$$
**常用的物理量平均值是**：

能量 $E$：
$$
E=\langle H \rangle = \sum_\sigma H(\sigma)P_\sigma^B
$$
平均磁化强度 $M$:
$$
\langle M \rangle=\frac{1}{N} \sum_i \sigma_i
$$

平均磁化率 $\chi$:
$$
\chi=\frac{\partial \langle M \rangle}{\partial H}=\frac{N}{k_b T}[\langle M^2\rangle-\langle M \rangle^2]
$$
比热$C_v$：
$$
C_v=\frac{d E}{d T}
$$

## 2.算法流程



1. 构型初始化
2. 设置温度区间
3. 先让当前构型演化到平衡态，然后才能开始统计
4. 随机选取一个自旋翻转(或者直接对所有格点遍历)
5. 计算翻转前后两种构型的能量差$\Delta E$ 
6. 若$\Delta E<0$, 返回3；否则计算出翻转概率，并与0和1之间的随机数做比较
7. 重复过程3-6，直至循环结束
8. 画图能量、比热、磁化率、磁化强度

## 3.编程实现

**尝试使用简单热门的Python语言** 

**参数设定：**

|  $J$  |   1   |
| :---: | :---: |
| $k_b$ |   1   |
|  $T$  |  0-6  |
| $h_i$ |   0   |



这里为了方便取$k_b=1, J=1$. 目前已知的临界温度的解析结果是
$$
T_c=2/\ln(1+\sqrt{2})\approx 2.269
$$

## 4.结果图示

下图是$16\times 16$ 格子模拟的结果，结果比较理想：

![ising15.jpg](http://upload-images.jianshu.io/upload_images/26717-e6304d07fd77f65c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



下图是$2\times 2$ 格子模拟的结果：

![ising2.png](http://upload-images.jianshu.io/upload_images/26717-b182b26f2af24045.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



从磁化强度和磁化率来看，$2\times 2$ 体系的模拟效果不是很理想。

## 5.总结提高	

模拟过程中要注意的一点是初始构型选定后，必须先让系统演化到平衡态，然后再开始进行 **Metropolis** 抽样， 因为在平衡态统计的框架下，系统只有到达平衡态之后各个物理量才能有确定的意义。

在验证程序正确性的时候，先选择尺寸为 $2\times 2$ 的格点，从平均磁化率和磁化强度和温度的关系来看临界温度，发现与解析结果差别较大，而从热容来看是与理论的临界温度$T_c$ 相吻合的。初步排除过非平衡因素之后，剩下的可能原因是体系的尺寸效应有关。 一方面实际在验证过程中，逐渐加大体系尺寸，可以观察到逐渐接近理论临界温度，另一方面还可能需要考察一下热容 和 磁化率、磁化强度计算准确度对尺寸的依赖情况。

## 代码附录

```python
#  PROGRAM DESCRIPITION:
# This program is  used to smimulate the 2 dimenssion Ising mdoel using
# the metropolis algorithm.
#
# For simplicity, I use python langulage to finish the  program.
#
# PROGRAMMER: caicailiushui
# DATE: 2017/12/25


from __future__ import division
import numpy as np

from numpy.random import rand    # to get the random number
import matplotlib.pyplot as plt  # to plot


# ------------------------------------------------------------------------------------------------
## 1.  Define the necessary functions used in the main program
# ------------------------------------------------------------------------------------------------

## function 1: to initial the system state
## N * N matrices
## matrix element {-1,1}
def initialstate(N):
#	state = 2 * np.random.randint(2, size = (N,N)) - 1
	state = np.ones((N,N))
	return state


## function 2: evolve to the equilibrium state
## Monte Carlo move using the metropolis algorithm
def mcmove(config, beta):
   
   for row in range(N):
       for col in range(N):
               row_val = row #np.random.randint(0, N)
               col_val = col #np.random.randint(0, N)
               posi =  config[row_val, col_val]
               nearspin = config[(row_val+1)%N,col_val] + config[row_val,(col_val+1)%N] + config[(row_val-1)%N,col_val] + config[row_val,(col_val-1)%N]
               diffEnergy = 2*posi*nearspin
               if diffEnergy < 0:
                   posi *= -1
               elif rand() < np.exp(-diffEnergy*beta):
                   posi *= -1
               config[row_val, col_val] = posi
   return config



## function 3: to calculate the energy of a given configuration

def calcEnergy(config):
    energy = 0.0
    dim = len(config)
    for row in range(dim):
    	for col in range(dim):
    		posi = config[row, col]
    		# near total spin
    		nearspin = config[(row + 1) % N, col] + config[(row - 1) % N, col] + config[row, (col + 1) % N] + config[row, (col - 1) % N]
    		energy += -posi*nearspin

    return energy/4.0


## function 4 : to calculate the total spin of a given configuration or  the magnetization
def calcMag(config):
	mag = np.sum(config)

	return mag

# ------------------------------------------------------------------------------------------------
## 2. Main code
#------------------------------------------------------------------------------------------------

# define the dimension of spin system

N       = 2 #16  # size of the spin lattice, N*N

# simulate parameters

Nt      = 1000 # number of temperature points

eqSteps = 1000 # uplimit of  the steps to equilibrium
mcSteps = 2000 # uplimit of  the total calculation times


Tc    = 2.269
T_arr = np.linspace(0.01, 6, Nt);   
Nt    = np.size(T_arr) # number of temperature points
# Initalization

Energy          = np.zeros(Nt)
Magnetization   = np.zeros(Nt)
SpecificHeat    = np.zeros(Nt)
Susceptibility  = np.zeros(Nt)



# Assited qualites

N1, N2  = 1.0/(mcSteps*N*N), 1.0/(mcSteps*mcSteps*N*N)

# Monto Carlo simulation

for m in range(len(T_arr)):
	E1 = M1 = E2 = M2 = 0
    
	config = initialstate(N)
    
	invT   = 1.0 / T_arr[m]
	invT2  = invT * invT

#	for i in range(eqSteps):  # equilibrate
#		mcmove(config, invT)  # Monto Carlo moves

	for i in range(mcSteps):
		mcmove(config, invT)
        
		Ene_tem = calcEnergy(config)
		Mag     = calcMag(config)

		E1 += Ene_tem
		M1 += Mag
		M2 += Mag*Mag
		E2 += Ene_tem*Ene_tem

		Energy[m]         = N1 * E1
		Magnetization[m]  = N1 * M1
		SpecificHeat[m]   = (N1*E2 - N2*E1*E1) * invT2
		Susceptibility[m] = (N1*M2 - N2*M1*M1)*invT


# Plot to show the final result
fig = plt.figure(figsize=(18,10));

sp  = fig.add_subplot(2, 2, 1);
plt.plot(T_arr, Energy, 'o', color="#6699A1");
plt.xlabel("Temperature (${T}$)", fontsize = 20);
plt.ylabel("Energy(${E}$)", fontsize = 20);


sp  = fig.add_subplot(2, 2, 2);
plt.plot(T_arr, abs(Magnetization), 'o', color="#F75C2F");
plt.xlabel("Temperature (${T}$)", fontsize=20);
plt.ylabel("Magnetization(${M}$) ", fontsize=20);


sp  = fig.add_subplot(2, 2, 3);
plt.plot(T_arr, SpecificHeat, 'o', color="#6699A1");
plt.xlabel("Temperature (${T}$)", fontsize=20);
plt.ylabel("Specific Heat(${C_v}$) ", fontsize=20);


sp  = fig.add_subplot(2, 2, 4);
plt.plot(T_arr, Susceptibility, 'o', color="#F75C2F");
plt.xlabel("Temperature (${T}$)", fontsize=20);
plt.ylabel("Susceptibility(${\chi}$)", fontsize=20);
```

