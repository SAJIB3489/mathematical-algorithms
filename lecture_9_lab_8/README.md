**Author:** Md Sajib Pramanic  

**Course:** Mathematical Algorithms (DSP) 

**MATLAB Version:** R2025a

# Hybrid Traditional + AI Image Classification Pipeline

### Results

| <p align="center"><img src="/lecture_9_lab_8/figure_8.png"/><br/>Figure 1</p> |
| ---------------------------------------------------------------------------------- |


## Overview

This MATLAB project demonstrates a **hybrid approach** combining **traditional image processing techniques** and **pre-trained Convolutional Neural Networks (CNNs)** to improve image classification performance.

The workflow consists of:

1. **Traditional pre-processing / segmentation**

   * K-Means color-based segmentation isolates the main object in the image.
2. **AI classification using a pre-trained CNN**

   * SqueezeNet is used to classify the isolated object.
3. **Comparison**

   * Classification results are compared between the **original image** and the **hybrid approach** (segmentation + CNN).

---

## Requirements

* MATLAB R2023a or later
* Image Processing Toolbox
* Deep Learning Toolbox
* Pre-trained network: `squeezenet`

---

## Run the code

Clone the git repository

```bash
git clone https://github.com/SAJIB3489/mathematical-algorithms.git
cd lecture_9_lab_7
```

### **How to Run**

1. Load the MATLAB script `lab_8.m`.
2. Ensure the sample image exists (`peppers.png` is used by default).
3. Run the script.

---

## Code Workflow

### 1. Load Image and AI Network

* Loads a sample image (e.g., `peppers.png`).
* Loads the pre-trained SqueezeNet CNN.
* Resizes the image for network input.

### 2. Baseline AI Classification

* The original image is directly fed into the CNN.
* Classification result and confidence are recorded for comparison.

### 3. Traditional Segmentation (K-Means)

* Converts the image to **Lab color space**.
* Applies **K-Means clustering** on `a` and `b` channels to segment colors.
* Masks out the background, leaving the object of interest.

### 4. AI Classification on Isolated Object

* The segmented object is resized and classified by the CNN.
* Classification results are recorded and compared with baseline.

### 5. Results & Visual Comparison

* Subplots show:

  1. Original Image
  2. Original Image input to AI
  3. Segmentation Mask
  4. Isolated Object
  5. Input to AI (Hybrid Approach)

* Observations are printed in the MATLAB console.

---

## Visual Observation

| Image                      | Description                                                                                                         |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| Original Image             | The raw input with background clutter.                                                                              |
| Original Image to AI       | Feeding original image into CNN may result in lower confidence or misclassification due to background interference. |
| Traditional Mask (K-Means) | Segmentation mask isolates the main object from the background.                                                     |
| Isolated Object            | Object of interest extracted, background removed, ready for AI.                                                     |
| Input to AI (Hybrid)       | AI classification now focuses purely on the object, improving accuracy and confidence.                              |

**Observation:**

* The **hybrid approach** (Traditional segmentation + AI classification) typically improves the CNN’s **confidence** and **accuracy** compared to feeding the **original image** directly.
* Traditional methods help the AI focus on the object of interest by reducing background noise.

---