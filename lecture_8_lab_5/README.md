# Results

| <p align="center"><img src="/lecture_8_lab_5/Lab_5_Figure_1.png"/><br/>Figure 1</p> |
| ---------------------------------------------------------------------------------- |


| <p align="center"><img src="/lecture_8_lab_5/Lab_5_Figure_2.png"/><br/>Figure 2</p> | <p align="center"><img src="/lecture_8_lab_5/Lab_5_Figure_3.png"/><br/>Figure 3</p> |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | 

| <p align="center"><img src="/lecture_8_lab_5/Lab_5_Figure_4.png"/><br/>Figure 4</p> | <p align="center"><img src="/lecture_8_lab_5/Lab_5_Figure_5.png"/><br/>Figure 5</p> |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | 



### Section 1 – Basic derivative filters (Sobel, Prewitt)

I used Sobel and Prewitt filters to detect edges based on image gradients.
They show where brightness changes sharply, marking edges in the image.

### Section 2 – Canny detector (multi-stage)

The Canny detector finds thin and clean edges using smoothing, gradient detection, and thresholding.
It gives better and more accurate edges than simple filters.

### Section 3 – Laplacian of Gaussian (LoG)

I used the LoG method, which smooths the image with a Gaussian filter and then detects edges using the Laplacian.
It can find both fine and detailed edges but may be sensitive to noise.

### Section 4 – Edge map → segmentation (Otsu threshold)

The Otsu method automatically finds a threshold from the image histogram to separate objects from the background.
It creates a binary mask that divides the image into two regions.

### Section 5 – Label and visualize regions

I labeled the connected regions in the binary image and displayed them in color.
This helps to count and visualize different segmented objects.

### Reflections

1. The Canny filter gives the thinnest and cleanest edges.
2. It works better than Sobel or Prewitt because it removes noise and uses double thresholds.
3. The Otsu method relates to histogram thresholding because it chooses the best split between dark and bright pixels automatically.
---


## Run the code

Clone the git repository

```bash
git clone https://github.com/SAJIB3489/mathematical-algorithms.git
cd lecture_8_lab_5
```