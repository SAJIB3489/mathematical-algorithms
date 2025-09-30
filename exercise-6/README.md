![image](/exercise-6/Figure_1_Exercise_6.png)

# Short description of my learning outcome

In this exercise, I learned how to generate a sinusoidal signal x = sin(2π·50t) over a discrete time vector t = -1:0.001:1 and visualize it. Using subplot, I plotted the time-domain waveform and then used fft, abs, and fftshift to compute and center its frequency spectrum. You can clearly see the symmetric peaks at ±50 Hz on the frequency axis f = -499.9:1000/2001:500, which helped connect sampling (Fs = 1000 Hz), signal length (N = 2001), and frequency resolution (Δf ≈ 0.5 Hz). I also practiced clean plotting with grid, titles, and labels, and selecting a time window for display.



## Run the code

Clone the git repository

```bash
git clone https://github.com/SAJIB3489/mathematical-algorithms.git
cd exercise-6
```