# Short description of each Discrete Singal


#### 1. Warm‑up: Finite Sequences → Polynomials


**The Cauchy-Schwarz Inequality**

```math
\left( \sum_{k=1}^n a_k b_k \right)^2 \leq \left( \sum_{k=1}^n a_k^2 \right) \left( \sum_{k=1}^n b_k^2 \right)
```

![image](/week3-discrete-signals-matlab/Fig_1.png)

The unit impulse signal has value ``1`` only at ``n = 0`` and 0 everywhere else. I use it to test how a system responds to a sudden input. You can think of it as a digital "spark."

#### 2. Unit Step Signal

![image](/week3-discrete-signals-matlab/Fig_2.png)

The unit step signal is ``0`` for negative time and ``1`` for ``n >= 0``.
I use it to represent switching behavior, like when a system turns ON. You can use it to model sudden changes.

#### 3. Ramp Signal

![image](/week3-discrete-signals-matlab/Fig_3.png)

The discrete ramp signal increases linearly with time.
I learned that it is useful to model steady growth or gradual increase in systems. We often use it for control and testing.

#### 4. Exponential Signal

![image](/week3-discrete-signals-matlab/Fig_4.png)

The exponential signal either grows or decays depending on the base value.
I understand it as a model for charging, discharging, or population growth. You will often see it in natural and digital systems.

#### 5. Signum Signal

![image](/week3-discrete-signals-matlab/Fig_5.png)

The signum signal shows the sign of ``n``.
It is ``-1`` for negative values of ``n``.
It is ``0`` when ``n = 0``.
It is ``+1`` for positive values of ``n``.
I use it to show direction changes. You can think of it like a digital "compass" that only tells you if you are below zero, at zero, or above zero.

#### 6. Sinc Signal

![image](/week3-discrete-signals-matlab/Fig_6.png)

The sinusoidal signal oscillates up and down between positive and negative values.
We see it in communication, sound waves, and many control systems. I find it interesting because almost every repeating process in nature can be represented with sinusoids.


## Run the code

Clone the git repository

```bash
git clone https://github.com/SAJIB3489/mathematical-algorithms.git
cd week3-discrete-signals-matlab
```

## Technical Blog

Checkout my blog post to know about [Exploring Discrete-Time Signals with MATLAB](https://dev.to/sajibpra/exploring-discrete-time-signals-with-matlab-6j)
