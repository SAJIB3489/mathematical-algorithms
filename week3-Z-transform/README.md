# Z Transform


### A1. Warm‑up: Finite Sequences → Polynomials

**(a)** For each sequence, write X(z) explicitly as a polynomial in z^{-1} and verify with MATLAB symbolic tools.

**i)**  
```math
X_1(z) = 1 + 2z^{-1} + 5z^{-2}
```

**ii)**  
```math
X_2(z) = 3z^{-1} + 4z^{-3}
```

**(b)**: 
We can write the Z-transform of a finite sequence as a polynomial in $z^{-1}$:

$$
X(z) = \sum_{n=0}^{N} x[n] z^{-n}
$$

It has no poles (except maybe at $z = 0$).
So, the Region of Convergence (ROC) is the entire $z$-plane, except possibly at $z = 0$ or $z = \infty$.

That means the Z-transform converges everywhere, except at those isolated points.

**MATLAB**

![A1](/week3-Z-transform/A1.png)

### A2. Infinite Sequences & ROC

For each sequence, derive X(z) and specify the ROC. Then, verify using symbolic MATLAB where possible.

**a.**  
```math
x[n] = a^n u[n],\quad X(z) = \frac{1}{1 - a z^{-1}},\quad \text{ROC:}\ |z| > |a|
```

**b.**  
```math
x[n] = (-0.8)^n u[n],\quad X(z) = \frac{1}{1 + 0.8 z^{-1}},\quad \text{ROC:}\ |z| > 0.8
```

**c.**  
```math
x[n] = - (0.9)^n u[-n-1],\quad X(z) = \frac{z}{z - 0.9},\quad \text{ROC:}\ |z| < 0.9
```

**Explaination:**

* For a right-sided sequence $a^n u[n]$, the ROC is $|z| > |a|$ (outside the pole).
* For a left-sided sequence $a^n u[-n-1]$, the ROC is $|z| < |a|$ (inside the pole).

The ROC never includes the poles themselves. It is determined by where the sum converges and always forms a ring (annulus) in the z-plane, centered at the origin and bounded by the magnitude of the poles.

**MATLAB**

![A2](/week3-Z-transform/A2.png)


### A3. Properties: Linearity & Shifting


**Linearity:**  
```math
Z\{2x_1[n] - 3x_2[n]\} = 2 \cdot \frac{1}{1 - 0.5 z^{-1}} - 3 \cdot \frac{1}{1 + 0.5 z^{-1}}
```

**Time-shift:**  
```math
Z\{x_1[n-3]\} = z^{-3} X_1(z) = \frac{z^{-3}}{1 - 0.5 z^{-1}}
```

**MATLAB**

![A3](/week3-Z-transform/A3.png)


### A4. Inverse Z-Transform


**a.**  
```math
X(z) = \frac{1}{1 - 0.7 z^{-1}} \implies x[n] = (0.7)^n u[n]
```

**b.**  
```math
X(z) = \frac{1 - 0.5 z^{-1}}{1 - 0.8 z^{-1}} \implies x[n] = (0.8)^n u[n] - 0.5 (0.8)^{n-1} u[n-1]
```

**MATLAB**

![A4](/week3-Z-transform/A4.png)


### A5. H(z), Poles/Zeros & Frequency Response

Filter frequency response

```math
H(z) = \frac{1 - 2.4 z^{-1} + 2.88 z^{-2}}{1 - 0.8 z^{-1} + 0.64 z^{-2}}
```

**(a)** Plot poles and zeros with zplane, list their values.

![A5](/week3-Z-transform/pole-zeros.png)

![A5.1](/week3-Z-transform/A5.png)


**(b)** Plot magnitude and phase responses with freqz:

![A5.2](/week3-Z-transform/frequency-response.png)


**(c)** Identify the filter type and justify.

magnitude response plot:

    If the magnitude is high at low frequencies ( w = 0 ) and drops at high frequencies ( w = π ), it is a low-pass filter.
    If the magnitude is low at w = 0 and high at w = π , it is a high-pass filter.

From pole-zero plot:

    If poles are near the unit circle at low angles, the filter passes low frequencies (low-pass).
    If poles are near w = π (negative real axis), it is high-pass.

After plotting, if you observe that the magnitude response is maximum at w = 0 and minimum at w = π , and the poles are near the real axis close to 1, then it's a low-pass filter. The zeros, if located near z = 1 , will create a notch at DC, but in this case, zeros/poles locations and the flat passband at low frequencies confirm the low-pass behavior.


----------------------------------------------------




## Run the code

Clone the git repository

```bash
git clone https://github.com/SAJIB3489/mathematical-algorithms.git
cd week3-Z-transform
```


