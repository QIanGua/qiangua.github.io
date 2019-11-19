---
title: Notes of Quantum Optimal Control
date: 2019-08-20
tags: Note
categories: Physics
---

# Notes of Quantum Optimal Control

The system Hamiltonian:
$$
H = \Delta_p(t)|e\rangle\langle e| + \frac{1}{2}[\Omega_p(t)|e\rangle\langle 0 |+\Omega_s(t)|e\rangle\langle 1| + h.c.],
$$

## Pulse 1 
$$
\Delta_p(t) = \Omega(t)\sin(\alpha),\\
\Omega_p(t) = \Omega(t)\cos(\alpha)\cos(\theta/2),\\
\Omega_s(t) = \Omega(t)\cos(\alpha)\sin(\theta/2)e^{-i\phi},\\
\Omega(t) = \Omega_0 \sin^2(\pi t/\tau).\\
\alpha=0,\theta=\pi/2,\phi=0\\
\tau=tmax=100 ns,\Omega_0\tau=4\pi
$$


$\alpha=0,\theta=\pi/2,\phi=0$

$\tau=tmax=100 ns,\Omega_0\tau=4\pi$

$dt=0.5 ns$

## Pulse 2

$$
\Delta_p(t) = 0,\\
\Omega_p(t) = \Omega(t)\cos(\theta(t)),\\
\Omega_s(t) = \Omega(t)\cos(\theta(t)),\\