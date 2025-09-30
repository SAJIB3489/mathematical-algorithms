# Results

![image](/exercise-10/Figure_1_Exercise_10.png)



### FIR (Finite Impulse Response)
        What it is: Feedforward only; output uses a finite number of past inputs.
        Why you use it: Guaranteed stability, can have exactly linear phase, simple to design and implement.
        Trade‑off: Often needs more taps (more compute and delay) for sharp filtering.
        Example: Moving average
            y[n] = (1/N) Σ_{k=0}^{N-1} x[n−k]


### IIR (Infinite Impulse Response)
        What it is: Uses feedback; output depends on past outputs too.
        Why I use it: Much more efficient (sharp roll‑off with low order), low latency for similar magnitude specs.
        Trade‑off: Phase is usually nonlinear; we must ensure poles are inside the unit circle for stability; more sensitive to quantization.
        Example: One‑pole low‑pass
            y[n] = α x[n] + (1−α) y[n−1], 0<α<1

### How we choose:

    If you need linear phase and guaranteed stability, we pick FIR.
    If we need sharp response with minimal order/latency and can tolerate phase distortion (or we’ll compensate it), we pick IIR.


### Magnitude responses
- With the provided, unnormalized coefficients:
  - The DC (ω = 0) magnitude equals N (5 and 9, respectively).
  - If you normalize by N, the DC gain becomes 1 and the shapes are identical, only vertically scaled.
- First null (deep notch) locations:
  - For an N‑point MAF, the first spectral null occurs at ω = 2π/N.
    - 5‑point: first null at ω = 2π/5 ≈ 0.4π rad/sample
    - 9‑point: first null at ω = 2π/9 ≈ 0.222π rad/sample
- Smoothing vs. transition:
  - The 9‑point MAF has a narrower main lobe and stronger high‑frequency attenuation than the 5‑point MAF. It smooths better but has a lower effective cutoff and larger delay.
- Passband droop:
  - Moving averages exhibit passband droop (the passband is not perfectly flat). Normalization makes DC unity, but droop persists as frequency increases from 0.

### Pole–zero maps
- Zeros:
  - The N‑point moving average has N‑1 zeros on the unit circle at the Nth roots of unity (excluding z = 1):
    - z_m = e^{j 2π m / N}, m = 1, 2, …, N−1.
  - These unit‑circle zeros create the periodic spectral nulls in |H(e^{jω})|.
- Poles:
  - With A(z) = 1 (no feedback), there are no finite poles in the usual FIR representation. Some texts show M poles at z = 0 when rewriting H(z) in powers of z rather than z^{-1}; MATLAB’s `tf2zpk(b,1)` treats the filter as pole‑free in that sense.

---

### Moving‑average FIR filter
- Definition (length N):
  - h[n] = 1 for n = 0 … N−1, and 0 otherwise (unnormalized)
  - With normalization, h[n] = 1/N for n = 0 … N−1
- Transfer function:
  - H(z) = ∑_{k=0}^{N−1} z^{−k} = e^{−jω(N−1)/2} · (sin(Nω/2) / sin(ω/2)) evaluated on the unit circle z = e^{jω}
  - Magnitude (unnormalized): |H(e^{jω})| = |sin(Nω/2) / sin(ω/2)|
  - Magnitude (normalized): |H_norm(e^{jω})| = (1/N) · |sin(Nω/2) / sin(ω/2)|
- Key properties:
  - Linear phase (constant group delay)
  - Group delay = (N−1)/2 samples:
    - 5‑point → 2 samples
    - 9‑point → 4 samples
  - Stable and always bounded (no feedback)
  - Frequency response is the Dirichlet kernel (or its normalized form)

---

## FIR vs. IIR filters

### FIR (Finite Impulse Response)
- Structure: Feed‑forward only (denominator A(z) = 1)
- Poles: None (in the standard z^{-1} form); always stable if implemented in finite precision with care
- Phase: Can be made exactly linear with symmetric coefficients (like moving average)
- Delay: Group delay = (N−1)/2 samples for linear‑phase FIRs
- Pros:
  - Guaranteed stability
  - Exact linear phase is easy
  - Robust to coefficient quantization
- Cons:
  - May require higher order (more taps) than IIR to achieve sharp transitions
  - More computation and latency for equivalent selectivity

### IIR (Infinite Impulse Response)
- Structure: Has feedback terms (A(z) ≠ 1)
- Poles: Present; must lie inside the unit circle for stability
- Phase: Typically nonlinear (unless specialized designs are used)
- Delay: Can achieve sharp transitions with fewer coefficients (lower latency and compute)
- Pros:
  - Efficient selectivity for a given order
  - Often fewer coefficients than FIR for similar magnitude specs
- Cons:
  - Potential stability and limit‑cycle issues
  - Phase is usually not linear
  - More sensitive to coefficient quantization and implementation details

Example IIR smoother (exponential moving average):
y[n] = α x[n] + (1 − α) y[n−1], 0 < α < 1  
This is a first‑order low‑pass with one pole at z = 1 − α (inside the unit circle).

---


## Run the code

Clone the git repository

```bash
git clone https://github.com/SAJIB3489/mathematical-algorithms.git
cd exercise-10
```