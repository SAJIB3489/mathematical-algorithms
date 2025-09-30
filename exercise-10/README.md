# Results

![image](/exercise-10/Figure_1_Exercise_10.png)



## FIR (Finite Impulse Response)

What it is: Feedforward only; output uses a finite number of past inputs.
Why you use it: Guaranteed stability, can have exactly linear phase, simple to design and implement.
Trade‑off: Often needs more taps (more compute and delay) for sharp filtering.
Example: Moving average
y[n] = (1/N) Σ_{k=0}^{N-1} x[n−k]


## IIR (Infinite Impulse Response)

What it is: Uses feedback; output depends on past outputs too.
Why I use it: Much more efficient (sharp roll‑off with low order), low latency for similar magnitude specs.
Trade‑off: Phase is usually nonlinear; we must ensure poles are inside the unit circle for stability; more sensitive to quantization.
Example: One‑pole low‑pass
y[n] = α x[n] + (1−α) y[n−1], 0<α<1

## How we choose:

If you need linear phase and guaranteed stability, we pick FIR.
If we need sharp response with minimal order/latency and can tolerate phase distortion (or we’ll compensate it), we pick IIR.


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