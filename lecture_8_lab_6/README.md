# Results

| <p align="center"><img src="/lecture_8_lab_6/Lab_8_Figure_1.png"/><br/>Figure 1</p> |
| ---------------------------------------------------------------------------------- |




### Section 1 – Load your own image

I loaded fabric image and converted it to grayscale.
This makes processing easier and faster by using only one channel.

### Section 2 – Pre-process: noise removal

I used a median filter to remove noise from the image.
This filter smooths the image while keeping edges clear.

### Section 3 – Enhance contrast

I used imadjust to improve contrast.
It stretches the intensity range so dark areas look darker and bright areas brighter.

### Section 4 – Extract features (edges or frequency)

I applied the Canny edge detector to find object edges.
It highlights boundaries and important details in the image.

### Section 5 – Optional frequency-domain mask

I used a low-pass filter in the frequency domain.
It keeps low frequencies and removes high frequencies, making the image smoother.

### Section 6 – Visualization

I displayed all results side by side to compare each stage.
It clearly shows how the image changes after each processing step.

### Report

1. This pipeline includes noise removal, enhancement, edge detection, and filtering.
2. Each step uses DSP ideas like filtering and transformation.
3. The result looks cleaner and more detailed, but parameter tuning may improve performance further.
---


## Run the code

Clone the git repository

```bash
git clone https://github.com/SAJIB3489/mathematical-algorithms.git
cd lecture_8_lab_6
```