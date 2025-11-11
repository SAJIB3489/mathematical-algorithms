**Author:** Md Sajib Pramanic  
**Course:** Mathematical Algorithms (DSP) 
**MATLAB Version:** R2025a

# Results

| <p align="center"><img src="/lecture_9_lab_7/Effect_of_Preprocessing_on_CNN_Classification.png"/><br/>Figure 1</p> |
| ---------------------------------------------------------------------------------- |


### **Overview**

This project demonstrates how combining **traditional image preprocessing techniques** with **AI-based denoising** can improve the performance of a **pre-trained Convolutional Neural Network (CNN)** in image classification tasks. The experiment compares three different input conditions to show how preprocessing affects classification accuracy.

---

### **Objectives**

1. Apply **traditional preprocessing** (noise removal and contrast enhancement) to improve image quality.
2. Apply **AI-based denoising** using the **DnCNN** deep learning model.
3. Use a **pre-trained CNN classifier (AlexNet)** for image classification.
4. Evaluate and compare classification results across:

   * Raw noisy images
   * Traditionally pre-processed images
   * AI-denoised (DnCNN) images

---

### **Methods Used**

| Stage                     | Technique                            | Purpose                                    |
| ------------------------- | ------------------------------------ | ------------------------------------------ |
| Noise Simulation          | Gaussian Noise                       | To degrade image intentionally for testing |
| Traditional Preprocessing | Wiener Filter + Contrast Enhancement | Noise reduction using classical methods    |
| AI Preprocessing          | DnCNN Pre-Trained Denoiser           | Deep learning-based noise removal          |
| Image Classification      | AlexNet (Pre-trained CNN)            | Recognizes objects in images               |
| Comparison                | Output Class Labels                  | Evaluates classification improvement       |

---

## Run the code

Clone the git repository

```bash
git clone https://github.com/SAJIB3489/mathematical-algorithms.git
cd lecture_9_lab_7
```

### **How to Run**

1. Place the MATLAB script and sample image (`cameraman.tif` or your own dataset) in the same folder.
2. Open MATLAB and run the script:

   ```matlab
   run('classification_comparison.m')
   ```
3. The script will:

   * Add noise to the image
   * Apply preprocessing methods
   * Perform classification using AlexNet
   * Display comparison results

---


### **Conclusion**

* CNN classification accuracy is **lowest** when using **raw noisy images**.
* **Traditional preprocessing** improves classification but may blur important features.
* **AI-based DnCNN preprocessing provides the best results**, because it removes noise **while preserving critical image details** needed for classification.

**Therefore, combining traditional + AI preprocessing yields the most robust classification results**, demonstrating the benefit of hybrid image processing workflows.

---