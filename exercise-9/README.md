![image](/exercise-9/Figure_1_Exercise_9.png)

# Short description of my learning outcome

I learned to analyze a signal’s spectrum using fft with a length argument. By using y = fft(x,512) (zero‑padding), I got a denser frequency grid, so the peaks at 15 Hz and 40 Hz look sharper. I built the frequency axis f = (0:N−1)*Fs/N, plotted magnitude and the unwrapped phase (in degrees), and zeroed tiny bins to stabilize phase. Most importantly, I saw that zero‑padding improves spectral display spacing but not the true frequency resolution, which is set by Fs/length(x).



## Run the code

Clone the git repository

```bash
git clone https://github.com/SAJIB3489/mathematical-algorithms.git
cd exercise-9
```