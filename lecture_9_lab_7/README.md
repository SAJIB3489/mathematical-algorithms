**Author:** Md Sajib Pramanic  

**Course:** Mathematical Algorithms (DSP) 

**MATLAB Version:** R2025a


# Results

| <p align="center"><img src="/lecture_9_lab_7/figure_7.png"/><br/>Figure 1</p> |
| ---------------------------------------------------------------------------------- |


## 1. Objective

This experiment demonstrates how different image filtering methods handle **Gaussian noise**. The task includes:

* Adding **Gaussian noise** to a clean image.
* Measuring image quality using **MSE, PSNR, and SSIM**.
* Comparing **traditional filters** (Mean, Median, Gaussian Blur) with an **AI-based pre-trained DnCNN model**.
* Providing both **quantitative results** and **visual observations**.

---

## 2. Noise Modeling

Gaussian noise was added to the original grayscale image:

[
I_{noisy} = I_{original} + N(0, \sigma^2)
]

In this experiment:

* Noise standard deviation: **σ = 0.04**
* MATLAB function used: `imnoise(originalImage, 'gaussian', 0, σ²)`

---

## 3. Filters Compared

| Filter            | Type       | Description                                                                    |
| ----------------- | ---------- | ------------------------------------------------------------------------------ |
| **Mean Filter**   | Linear     | Averages neighborhood pixels, smooths noise but blurs edges.                   |
| **Median Filter** | Non-linear | Preserves edges better, commonly used for salt-and-pepper noise.               |
| **Gaussian Blur** | Linear     | Weighted smoothing, reduces noise softly but still causes blurring.            |
| **DnCNN**         | AI / CNN   | Deep learning model trained to remove Gaussian noise while preserving texture. |

---

## 4. Image Quality Metrics

The following metrics were computed:

* **MSE (Mean Square Error)** – lower is better
* **PSNR (Peak Signal-to-Noise Ratio)** – higher is better
* **SSIM (Structural Similarity Index)** – higher is better (closer to original image structure)

```matlab
mseVal = immse(filteredImage, originalImage);
psnrVal = psnr(filteredImage, originalImage);
ssimVal = ssim(filteredImage, originalImage);
```

---

## 5. Visual Observation Results

### **Original vs. Noisy**

* The noisy image appears grainy.
* Noise distorts fine details and contrast.

### **Mean Filter**

* Noise is reduced somewhat.
* **Significant blurring** occurs.
* Edges become less sharp.

### **Median Filter**

* Preserves edges better than Mean filter.
* Works best for **impulsive noise**, but **less effective for Gaussian noise**.
* Slight improvement but detail still lost.

### **Gaussian Blur**

* Produces a smooth and visually pleasing result.
* However, edges still lose sharpness.
* Some fine textures are washed out.

### **AI-Based DnCNN (Best Result)**

* **Noise is removed effectively** while **preserving small details and edges**.
* Produces the **highest PSNR and SSIM** values.
* Looks **closest to the original image** compared to traditional methods.

---

## 6. Conclusion

| Method         | Noise Removal         | Edge Preservation | Overall Effectiveness |
| -------------- | --------------------- | ----------------- | --------------------- |
| Mean Filter    | Moderate              | Poor              | Low                   |
| Median Filter  | Moderate for Gaussian | Good              | Medium                |
| Gaussian Blur  | Moderate              | Medium            | Medium                |
| **AI (DnCNN)** | **Excellent**         | **Excellent**     | **High (Best)**       |



## Run the code

Clone the git repository

```bash
git clone https://github.com/SAJIB3489/mathematical-algorithms.git
cd lecture_9_lab_7
```

### **How to Run**

1. Place the MATLAB script and sample image (`cameraman.tif` or your own dataset) in the same folder.
2. Open MATLAB and run the script:

---