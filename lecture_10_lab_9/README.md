**Author:** Md Sajib Pramanic  

**Course:** Mathematical Algorithms (DSP) 

**MATLAB Version:** R2025a

# Image Preprocessing and Segmentation without AI

### Results

| <p align="center"><img src="/lecture_10_lab_9/result_1_figure.png"/><br/>Winter Tire</p> | <p align="center"><img src="/lecture_10_lab_9/result_2_figure.png"/><br/>Summer Tire</p> |
| ---------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |


---

## Output

| Image               | Detected Studs | Classification   |
| ------------------- | -------------- | ---------------- |
| `studded_tire.jpeg` | 144            | STUDDED TIRE     |
| `summer_tire.jpg`   | 23             | NON-STUDDED TIRE |

---

## Overview

This MATLAB project detects **metal studs on winter tires** from images using a combination of image preprocessing and connected-component analysis. The program also differentiates **summer tires** that have no studs, minimizing false positives.

The repository contains **two sample images**:
- `studded_tire.jpeg` → a winter tire with metal studs  
- `summer_tire.jpg` → a summer tire without studs  

The detector reads both images, identifies bright metallic studs on the tire surface, counts them, and visualizes the results.

---

## Methodology

The detection pipeline follows the **task description and standard computer vision steps**:

1. **Read and resize images**  
   - Input images are resized to 50% of their original size for faster processing.

2. **Convert to grayscale**  
   - Color images are converted to grayscale to simplify intensity-based processing.

3. **Tire area segmentation**  
   - Adaptive thresholding identifies **dark regions** corresponding to the tire surface.  
   - Morphological operations (hole filling, small-object removal) improve mask quality.

4. **Stud candidate detection**  
   - **Top-hat filtering** enhances small, bright studs on a darker tire surface.  
   - Local adaptive thresholding isolates potential studs inside the tire mask.  
   - Morphological opening and closing remove noise and small artifacts.

5. **Connected-component analysis**  
   - `regionprops` computes geometric and intensity features of each candidate:  
     - Area  
     - Perimeter  
     - Eccentricity  
     - Mean intensity  

6. **Candidate filtering**  
   - Circularity, eccentricity, area, and brightness thresholds are applied to identify **true metal studs**.  

7. **Decision rule**  
   - If a tire has **more than 15 studs** or a **stud density above 0.00025**, it is classified as **STUDDED**; otherwise, **NON-STUDDED**.

8. **Visualization**  
   - Displays the original image, candidate studs, and final detected studs highlighted on the tire.  
   - Shows the stud count and classification result (STUDDED or SUMMER TIRE).

---

## Run the code

Clone the git repository

```bash
git clone https://github.com/SAJIB3489/mathematical-algorithms.git
cd lecture_10_lab_9
```


2. Open MATLAB and navigate to the repository folder.

3. Run the main script:

```matlab
tire_stud_detector.m
```

4. The script will:

   * Read both images (`studded_tire.jpeg` and `summer_tire.jpg`)
   * Detect and count studs
   * Display figures showing:

     1. Original image
     2. Binary candidate studs
     3. Studs overlaid on the original image
   * Print the tire classification in the figure title.

---

## Output

| Image               | Detected Studs | Classification   |
| ------------------- | -------------- | ---------------- |
| `studded_tire.jpeg` | 144            | STUDDED TIRE     |
| `summer_tire.jpg`   | 23             | NON-STUDDED TIRE |

---