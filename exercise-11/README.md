# Results

![image](/exercise-11/Figure_1_Exercise_11.png)



---

### Exercise 11: FIR Filter Types – Magnitude, Phase, and Zero-Pole Diagrams

In this exercise, I used the given **impulse responses** (`h1`–`h4`) for FIR Types I–IV to plot **Magnitude**, **Phase**, and **Zero-Pole** diagrams.

* **Magnitude response (`abs(H)`)**: Shows how each filter amplifies or attenuates different frequencies. Symmetric filters (Type I & II) produce smooth linear-phase responses, while antisymmetric filters (Type III & IV) show characteristic magnitude dips due to zeros on the unit circle.
* **Phase response (`unwrap(angle(H))`)**: Linear-phase behavior is visible for all types. Using `unwrap` removes phase jumps, making the slope easier to interpret.
* **Zero-Pole diagram (`zplane(h,1)`)**: Zeros’ positions explain the magnitude dips in the frequency response and indicate filter stability.

The figure is organized in **subplots** with three columns per filter: **Left → Magnitude, Middle → Phase, Right → Zero-Pole**, allowing a direct comparison of all four FIR filter types in one view.


---


## Run the code

Clone the git repository

```bash
git clone https://github.com/SAJIB3489/mathematical-algorithms.git
cd exercise-10
```