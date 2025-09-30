![image](/exercise-8/Figure_1_Exercise_8.png)

# Short description of my learning outcome

I learned to build a sampled signal x = sin(2π15t) + sin(2π40t) with Fs = 100 Hz, compute its DFT using fft, and plot both magnitude and phase. We reduced phase noise by zeroing tiny-magnitude bins (m < 1e-6) and used unwrap(angle(y)) for a continuous phase. With the frequency axis f = (0:N-1)·Fs/N, we saw clear spectral lines at 15 Hz and 40 Hz. This tied together sampling rate, DFT length, frequency resolution (Δf = Fs/N), and phase interpretation.



## Run the code

Clone the git repository

```bash
git clone https://github.com/SAJIB3489/mathematical-algorithms.git
cd exercise-8
```