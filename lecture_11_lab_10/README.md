**Author:** Md Sajib Pramanic  

**Course:** Mathematical Algorithms (DSP) 

**MATLAB Version:** R2025a


### Results

| <p align="center"><img src="/lecture_11_lab_10/dark_house_result.png"/><br/>Dark House</p> |
| ---------------------------------------------------------------------------------- |


---

## Low-Light Image Enhancement Demo

This study demonstrates how to use a **pretrained “Learning to See in the Dark” (SID-style)** deep-learning model in MATLAB **without needing the full SID dataset or training the model yourself**.
The script loads a pretrained low-light enhancement network, simulates a dark/noisy image, and then uses the model to brighten and clean it.

---

## **What the Script Does**

### **1. Download the Pretrained Model (first run only)**

* Creates a folder in MATLAB’s temporary directory.
* Checks if the pretrained `.mat` model exists.
* If not, it downloads a small ZIP file from MathWorks and extracts it.
* This gives you a ready-to-use `netTrained` network.

### **2. Load the Network**

```matlab
load(modelFile, "netTrained");
```

This loads a deep neural network that mimics a camera pipeline for extremely low-light enhancement.

### **3. Load a Normal RGB Image**

The script reads an example image (`dark_house.png`), resizes it, and converts it to `single` precision.

### **4. Simulate a Dark + Noisy Image**

To avoid needing real RAW low-light data:

* The brightness is drastically reduced (multiplied by `0.03`).
* Gaussian noise is added.

This produces a “fake” low-light image that the network can try to enhance.

### **5. Create a Fake RAW 4-Channel Input**

The SID model expects a 4-channel RAW-like input.
Since we don’t have real RAW images, the script:

* Converts the RGB image to grayscale.
* Replicates it into 4 channels.

### **6. Convert to `dlarray` and Send to GPU (optional)**

The input is wrapped in a format the network understands (`SSCB`) and optionally moved to the GPU for faster inference.

### **7. Run the Model**

```matlab
out = predict(netTrained, input);
```

This produces an enhanced 3-channel RGB output.

### **8. Convert the Output Back to a Normal Image**

The network output is gathered from GPU/dlarray format and converted to `uint8`.

### **9. Display Results**

The script shows three images side by side:

1. **Original image**
2. **Simulated dark + noisy version**
3. **Network’s enhanced output**

---

## Run the code

1. Clone the git repository

```bash
git clone https://github.com/SAJIB3489/mathematical-algorithms.git
cd lecture_11_lab_10
```

2. Run the main script:

---