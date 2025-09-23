# Short description of each Discrete Singal


#### 1. Warm‑up: Finite Sequences → Polynomials

**(a)** For each sequence, write X(z) explicitly as a polynomial in z^{-1} and verify with MATLAB symbolic tools.

**i)**  
```math
X_1(z) = 1 + 2z^{-1} + 5z^{-2}
```

**ii)**  
```math
X_2(z) = 3z^{-1} + 4z^{-3}
```

**(b)**: We can write the Z-transform of a finite sequence as a polynomial in \( z^{-1} \):  

\[
X(z) = \sum_{n=0}^{N} x[n] z^{-n}
\]

It has no poles (except maybe at \( z = 0 \)).  
So, the Region of Convergence (ROC) is the entire \( z \)-plane, except possibly at \( z = 0 \) or \( z = \infty \).  

That means the Z-transform converges everywhere, except at those isolated points.  



### **A2 – Infinite Sequences & ROC**

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

---

### **A3 – Properties: Linearity & Shifting**

**Linearity:**  
```math
Z\{2x_1[n] - 3x_2[n]\} = 2 \cdot \frac{1}{1 - 0.5 z^{-1}} - 3 \cdot \frac{1}{1 + 0.5 z^{-1}}
```

**Time-shift:**  
```math
Z\{x_1[n-3]\} = z^{-3} X_1(z) = \frac{z^{-3}}{1 - 0.5 z^{-1}}
```

---

### **A4 – Inverse Z-Transform**

**a.**  
```math
X(z) = \frac{1}{1 - 0.7 z^{-1}} \implies x[n] = (0.7)^n u[n]
```

**b.**  
```math
X(z) = \frac{1 - 0.5 z^{-1}}{1 - 0.8 z^{-1}} \implies x[n] = (0.8)^n u[n] - 0.5 (0.8)^{n-1} u[n-1]
```

---

### **A5 – H(z), Poles/Zeros & Frequency Response**

**Transfer Function:**  
```math
H(z) = \frac{1 - 2.4 z^{-1} + 2.88 z^{-2}}{1 - 0.8 z^{-1} + 0.64 z^{-2}}
```

---

Let me know if you need more formulas or LaTeX formatting for any additional part!


----------------------------------------------------






## Run the code

Clone the git repository

```bash
git clone https://github.com/SAJIB3489/mathematical-algorithms.git
cd week3-discrete-signals-matlab
```

## Technical Blog

Checkout my blog post to know about [Exploring Discrete-Time Signals with MATLAB](https://dev.to/sajibpra/exploring-discrete-time-signals-with-matlab-6j)

