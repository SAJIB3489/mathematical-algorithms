# Results

| <p align="center"><img src="/lecture_7_lab_1/Lab_1_Figure_1.png"/><br/>Figure 1</p> |
| ---------------------------------------------------------------------------------- |


| <p align="center"><img src="/lecture_7_lab_1/Lab_1_Figure_2.png"/><br/>Figure 2</p> | <p align="center"><img src="/lecture_7_lab_1/Lab_1_Figure_3.png"/><br/>Figure 3</p> | <p align="center"><img src="/lecture_7_lab_1/Lab_1_Figure_4.png"/><br/>Figure 4</p> |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |

| <p align="center"><img src="/lecture_7_lab_1/Lab_1_Figure_5.png"/><br/>Figure 5</p> | <p align="center"><img src="/lecture_7_lab_1/Lab_1_Figure_6.png"/><br/>Figure 6</p> | <p align="center"><img src="/lecture_7_lab_1/Lab_1_Figure_7.png"/><br/>Figure 7</p> |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |



### 0) Load and inspect an image

I started by loading the image (peppers.png or cameraman.tif) and converting it to grayscale. This helps focus only on brightness (luminance) instead of color, which is important for understanding sampling and quantization. I also checked the image size and pixel value range to know what I’m working with.

### 1) Quantization and dynamic range

Here, I tested how reducing bit depth affects image quality. When I reduced it from 8-bit to ~6-bit and ~4-bit, I noticed visible banding and loss of smooth gradients. The 4-bit version looked more “posterized.” This shows how fewer intensity levels cause visible jumps between shades.

### 2) Histogram and contrast stretching

I plotted histograms before and after applying contrast stretching. The original image had pixel values mostly in the middle range, but after stretching, the histogram spread across the full range (0–255). This made the image look clearer and improved the visibility of darker and brighter details.

### 3) Gamma correction

In this part, I experimented with nonlinear brightness changes. When I used gamma < 1, the image became brighter; with gamma > 1, it became darker. Gamma correction doesn’t just stretch contrast—it changes how mid-tones are displayed, which is useful for adjusting image brightness perception.

### 4) Sampling and aliasing

I reduced the image size aggressively (downsampled) and then scaled it back up. The result looked blocky and lost fine details. This happens because of aliasing — when the sampling rate is too low to capture the image details (violating the Nyquist theorem). It shows why proper sampling frequency is important to avoid visual distortions.

6) Short reflections

1. Bit-depth and banding:
When I reduced bit-depth, I saw clear steps or bands in smooth areas. That’s because fewer gray levels mean less smooth transitions, causing posterization.

2. Contrast stretching:
Stretching expanded the histogram range and made hidden details in shadows and highlights more visible. The image looked more dynamic and natural.

3. Aliasing from downsampling:
Aggressive downsampling removed high-frequency details, which reappeared as jagged or false patterns when resizing back. This happens when the sampling rate is below twice the highest frequency, as explained by the Nyquist rule.
---


## Run the code

Clone the git repository

```bash
git clone https://github.com/SAJIB3489/mathematical-algorithms.git
cd exercise-10
```