---
title: "LaTeX"
date: 2016-09-07 
tags:  ["LaTex", "Quantum"]
---


## 质能公式 
$$ E=mc^{2} $$

$$
\frac{\partial u}{\partial t} = h^2 \left( \frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2} + \frac{\partial^2 u}{\partial z^2}\right)
$$

# Proof 
$$
e^{i\sigma_{z}\phi}\sigma_ye^{-i\sigma_z\phi}=e^{2i\sigma_z\phi}\sigma_y
$$

## Solution 


$$
\begin{align}
e^{i\sigma_{z}\phi}\sigma_ye^{-i\sigma_z\phi}
&=e^{i\sigma_{z}\phi}(e^{-i\sigma_z\phi}\sigma_y+[\sigma_y,e^{-i\sigma_z\phi}])\\\\
&=\sigma_y+e^{i\sigma_{z}\phi}[\sigma_y,cos(\phi)-i sin(\sigma_z\phi)]\\\\
&=\sigma_y+e^{i\sigma_{z}\phi}[\sigma_y,-i\sigma_zsin(\phi)]\\\\
&=\sigma_y-i sin(\phi) e^{i\sigma_{z}\phi}[\sigma_y,\sigma_z]\\\\
&=\sigma_y+2isin(\phi) e^{i\sigma_z\phi}\sigma_z\sigma_y\\\\
&=e^{i\sigma_z\phi}(e^{-i\sigma_z\phi}\sigma_y+2i\sigma_zsin(\phi)\sigma_z\sigma_y)\\\\
&=e^{i\sigma_z\phi}(cos(\sigma_z\phi)+i\sigma_zsin(\phi))\sigma_y\\\\
&=e^{2i\sigma_z\phi}\sigma_y
\end{align}
$$

$$
\begin{align}
x &= \sqrt{4^2-1^2} \\\\
  &= \sqrt{15}.
\end{align} 
$$

## Lorenz Attractor 
$$
\begin{align}
\dot{x} & =  \sigma(y-x) \\\\
\dot{y} & = \rho x - y - xz \\\\
\dot{z} & = -\beta z + xy
\end{align} 
$$

## Maxwell Equation 
$$
\begin{align}
\nabla\cdot\vec{E} &= \frac{\rho}{\epsilon_0} \\\\
\nabla\cdot\vec{B} &= 0 \\\\
\nabla\times\vec{E} &= -\frac{\partial B}{\partial t} \\\\
\nabla\times\vec{B} &= \mu_0\left(\vec{J}+\epsilon_0\frac{\partial E}{\partial t} \right)
\end{align}
$$

## Useful formulas 
$$
\begin{align}
\hat{A}\hat{B}\hat{C}&=\hat{A}(\hat{C}\hat{B}+[\hat{B},\hat{C}])\\\\
\hat{I}&=e^{i\sigma\_z\phi}e^{-i\sigma\_z\phi}\\\\
e^{i\sigma\_z\phi}&=cos(\sigma\_z\phi)+isin(\sigma\_z\phi)\\\\
                 &=cos(\phi)+i\sigma\_zsin(\phi)\\\\
[\sigma\_i,\sigma_j]&=i\varepsilon\_{ijk}\sigma_k\\\\
\sigma\_i\sigma_j&=i\varepsilon_{ijk}\sigma_k
\end{align}
$$

