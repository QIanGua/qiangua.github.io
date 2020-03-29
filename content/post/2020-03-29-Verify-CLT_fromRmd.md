---
title: "Verifying Central Limit Theorem with R Language"
author: "Qiangua"
date: "2020-03-29"
tags:
    - Rmarkdown
---




## Question 

**一个随机量可能是 $1$,也可能是 $‐1$。两个值的几率都是 $1/2$。现进行 $1000$ 次实验,每次实验进行 $100$ 次随机量测试。模拟这个实验, 验证中心极限定理。**

**Sloution:**

Definition:

number of observations: $N_{observations} = 1000$,

number of trials: $N_{trials} = 100$,

probability of success on each trial: $X_i(i=1,N_{observations})$,

mean vale of $X_i$: $\overline{X}$


```r
library(ggplot2)
library(magrittr)
set.seed(2020)
number_observation <- 1000
number_trial <- 100
p_val <- 0.5

trial_mean <- rep(0, number_observation)
trial_std <- rep(0, number_observation)

for (idx in 1:number_observation) {
  trial = rbinom(number_trial, 1, p_val)
  trial_mean[idx] <- mean(trial)
  trial_std[idx] <- (sum(trial) - number_trial*p_val) / sqrt(number_trial*p_val*(1-p_val)) 
}

df <- data.frame(heads = 1:number_observation,
                 trial_mean = trial_mean,
                 trial_std = trial_std)

mean_X1 <- df$trial_mean %>% mean()
sd_X1 <- df$trial_mean %>% sd()

mean_X2 <- df$trial_std %>% mean()
sd_X2 <- df$trial_std %>% sd()

ggplot(df,aes(x = trial_std)) +
  geom_histogram(bins = 30, aes(y=..density..),color = "black", size = 0.5, fill = "gray") +
  stat_function(fun = dnorm, args = list(mean = mean_X2 , sd = sd_X2), colour = "red", size=1) + 
  scale_x_continuous(breaks=seq(-3,+3,1), limits=c(-3,+3)) + 
  scale_y_continuous(breaks=seq(0,0.5,0.1),limits = c(0,0.5)) +
  xlab("means") + 
  ylab("density")
```

{{< figure src="/ox-hugo/unnamed-chunk-1-1.png" >}}


