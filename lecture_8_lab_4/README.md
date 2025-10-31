# Results

| <p align="center"><img src="/lecture_8_lab_4/Lab_4_Figure_1.png"/><br/>Figure 1</p> |
| ---------------------------------------------------------------------------------- |


| <p align="center"><img src="/lecture_8_lab_4/Lab_4_Figure_2.png"/><br/>Figure 2</p> | <p align="center"><img src="/lecture_8_lab_4/Lab_4_Figure_3.png"/><br/>Figure 3</p> |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |


### Reflection

1. The median filter removes salt and pepper noise better than other filters. This happens because the median filter replaces each pixel with the middle value in its neighborhood. It removes black and white dots without changing sharp edges too much.

2. Linear filters, like the average or Gaussian filters, blur the image more. They take the mean of nearby pixels, which smooths both noise and edges. As a result, the image becomes less sharp.

3. An adaptive filter could check if a pixel is noise or part of an edge. It would then choose the best method — strong filtering for noisy areas and light filtering for edge areas. This way, we can keep more image details while still reducing noise.
---


## Run the code

Clone the git repository

```bash
git clone https://github.com/SAJIB3489/mathematical-algorithms.git
cd lecture_8_lab_4
```