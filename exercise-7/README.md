![image](/exercise-7/Figure_1_Exercise_7.png)

# Short description of my learning outcome

I learned to create a discrete time vector t = -1:0.001:1 (Fs = 1000 Hz) and build a composite signal x = sin(2π50t) + sin(2π75t). Using subplot, I plotted a short time window and observed the beating pattern from the two tones. I computed the magnitude spectrum with fft, centered it using fftshift, set the frequency axis f = -499.9:1000/2001:500, and confirmed peaks at ±50 Hz and ±75 Hz. This helped me connect sampling rate, length (N = 2001), and frequency resolution (Δf ≈ 0.5 Hz).



## Run the code

Clone the git repository

```bash
git clone https://github.com/SAJIB3489/mathematical-algorithms.git
cd exercise-7
```