Author: Md Sajib Pramanic
Course: Mathematical Algorithms (DSP) — Image Processing Labs
MATLAB Version: R2025a


# Results

| <p align="center"><img src="/lecture_7_lab_2/Lab_2_Figure_1.png"/><br/>Figure 1</p> |
| ---------------------------------------------------------------------------------- |


| <p align="center"><img src="/lecture_7_lab_2/Lab_2_Figure_2.png"/><br/>Figure 2</p> | <p align="center"><img src="/lecture_7_lab_2/Lab_2_Figure_3.png"/><br/>Figure 3</p> | 
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |

| <p align="center"><img src="/lecture_7_lab_2/Lab_2_Figure_4.png"/><br/>Figure 4</p> | <p align="center"><img src="/lecture_7_lab_2/Lab_2_Figure_5.png"/><br/>Figure 5</p> |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | 



### 0) Load image

I loaded peppers.png (or cameraman.tif as fallback) and converted it to grayscale. Working with grayscale simplifies convolution experiments since we only care about intensity changes, not color.

### 1) Delta image & impulse response

I created a delta (impulse) image and convolved it with a 3×3 average filter. The resulting impulse response shows how each pixel in the filter contributes to the output. It helps visualize the kernel’s effect before applying it to real images.

### 2) Low-pass filtering: box vs Gaussian

I applied 3×3 and 7×7 box filters and a Gaussian filter. I noticed that larger box filters blur more but can create blocky artifacts. The Gaussian produces smoother blurring with less ringing. Using separable Gaussian makes the computation faster because I can apply two 1D filters instead of one 2D filter.

### 3) Unsharp masking (sharpening)

I blurred the image using a Gaussian filter, subtracted it from the original to get the high-frequency mask, and added it back to sharpen. This highlights edges while preserving the overall image. You can clearly see how details pop out compared to the blurred version.

### 4) Edge detection: Sobel & Laplacian

I applied Sobel filters in x and y directions and computed gradient magnitude. The Sobel filters detect directional edges, while the Laplacian detects all edges regardless of orientation. Together, they show different ways to extract edges from an image.

### 5) Correlation vs convolution

I compared conv2 and imfilter with convolution mode. The difference is negligible (almost zero), but conceptually, convolution flips the kernel while correlation does not. Understanding this is important for designing filters correctly.

### 6) Boundary handling

I tested replicate, symmetric, and circular boundary modes.

replicate extends edge pixels.

symmetric mirrors edges, reducing artifacts.

circular wraps around, which can create odd edge effects.
You can see that corners and edges change depending on the boundary mode.

### 7) Reflections

1. Gaussian vs large box LP:
I prefer Gaussian because it has smoother frequency response and avoids sharp artifacts that large box filters can cause.

2. Separable filters:
By separating a 2D filter into two 1D passes, we reduce computation from N² to 2N operations, which is much faster for large kernels.

3. Boundary effects:
How we handle boundaries changes edge appearance—mirrored edges (symmetric) look more natural, while replicated or circular edges may create visible artifacts at corners.
---


## Run the code

Clone the git repository

```bash
git clone https://github.com/SAJIB3489/mathematical-algorithms.git
cd lecture_7_lab_2
```