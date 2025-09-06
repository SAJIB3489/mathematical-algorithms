
<p align="center">
<img src="https://github.com/user-attachments/assets/8a702f55-bca9-40c0-82e5-52398319f6dc" alt="savonia logo" width="400"/>
</p>



This repository serves as a playground and a comprehensive resource for understanding the professional course called `Mathematical Algorithms`.

It is designed to help learners and practitioners explore, implement, and experiment with a wide range of algorithms that are fundamental to mathematics and computer science. The repository includes well-documented code examples, explanations, and problem-solving techniques that are commonly covered in a `Mathematical Algorithms` course.


**Course Lecturer:** Osman Torunoglu




## Assignment-1: From Analog to Digital Signals with MATLAB

**Learning Objectives:**

1. Understand the complete path from analog signals to digital representation.
2. Simulate each step in MATLAB: signal generation, sampling, quantization, and encoding.    
3. Relate the concepts to IoT sensor data acquisition.

**Homework**

    1. Modify the MATLAB script:
        1.1. Try different sampling frequencies (below Nyquist, at Nyquist, and above Nyquist).
        1.2. Use different quantization levels (8, 16, 64).
    2. Plot and compare the effect on signal quality.


**Analog** -> **Sampling** -> **Quantization** -> **Encoding** -> **Bitstream**


```Matlab
%% Analog to Digital Signal Processing Simulation

clc; clear; close all; % Clear my workspace and command window



%% 1. Analog Signal Generation
t = 0:0.0001:0.01;       % very fine step (continuous-like time)
f = 100;                 % frequency = 100 Hz
x_analog = sin(2*pi*f*t);

figure;
plot(t, x_analog, 'LineWidth', 1.5);
title('Analog Signal (Sine Wave)');
xlabel('Time (s)'); ylabel('Amplitude');

%% 2. Sampling
Fs_values = [150, 200, 500];   % Below Nyquist, At Nyquist, Above Nyquist

for Fs = Fs_values
    Ts = 1/Fs;               % Sampling period
    n = 0:Ts:0.01;           % Discrete sample points
    x_sampled = sin(2*pi*f*n);

    figure;
    stem(n, x_sampled, 'filled');
    title(['Sampled Signal at Fs = ' num2str(Fs) ' Hz']);
    xlabel('Time (s)'); ylabel('Amplitude');

    %% 3. Quantization for each sampling frequency
    bit_values = [8, 16, 64];   % Different quantization levels

    for bits = bit_values
        levels = 2^bits;                    % Quantization levels
        x_min = min(x_sampled);
        x_max = max(x_sampled);
        q_step = (x_max - x_min)/levels;    % Step size

        x_index = round((x_sampled - x_min)/q_step); % Map samples to indices
        x_quantized = x_index*q_step + x_min;        % Map back to amplitude

        figure;
        stem(n, x_quantized, 'filled');
        title(['Quantized Signal (' num2str(bits) '-bit, Fs=' num2str(Fs) ' Hz)']);
        xlabel('Time (s)'); ylabel('Amplitude');

        %% 4. Encoding (Binary Representation)
        binary_codes = dec2bin(x_index, bits); % Convert indices to binary words

        disp(['--- First 10 encoded samples (Fs=' num2str(Fs) ', bits=' num2str(bits) ') ---']);
        disp(binary_codes(1:min(10,end),:));

        %% 5. Digital Bitstream
        bitstream = reshape(binary_codes.',1,[]); % Concatenate into one string
        disp(['--- First 40 bits of the stream (Fs=' num2str(Fs) ', bits=' num2str(bits) ') ---']);
        disp(bitstream(1:min(40,length(bitstream))));

        %% Summary
        fprintf('\nSimulation complete for Fs = %d Hz, %d bits\n', Fs, bits);
        fprintf('Analog -> Sampling -> Quantization -> Binary Encoding -> Digital Stream\n');
        fprintf('Bits per sample: %d\n', bits);
        fprintf('Total samples: %d\n', length(x_sampled));
        fprintf('Total bits: %d\n\n', length(bitstream));
    end
end
```

**Plots**


<p align="center">
  <img src="https://github.com/user-attachments/assets/22bcbf99-a7c0-43e8-ad0e-18ec868606c1" alt="Analog Sine (Sine wave)" title="Analog Sine (Sine wave)">
</p>

| <p align="center"><img src="https://github.com/user-attachments/assets/495afb88-630a-4d29-a8e7-6976180526ab"/><br/></p> | <p align="center"><img src="https://github.com/user-attachments/assets/d48313dd-6ef8-4aff-b777-6d46cd526416"/><br/></p> |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |

| <p align="center"><img src="https://github.com/user-attachments/assets/9aba5231-0829-4533-872b-535a989f20cc"/><br/></p> | <p align="center"><img src="https://github.com/user-attachments/assets/b0ea39cc-fbe6-4b04-a538-54f0b4791119"/><br/></p> |
| ---------------------------------------------------------------------------------------------| ------------------------------------------------------------------------------------- |

| <p align="center"><img src="https://github.com/user-attachments/assets/6b9991e9-8e29-4aef-bd6c-66c5a8f41daf"/><br/></p> | <p align="center"><img src="https://github.com/user-attachments/assets/a5631cc5-1085-4fb5-8840-83b12d3cab72"/><br/></p> |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |

| <p align="center"><img src="https://github.com/user-attachments/assets/1683ce95-aec5-4173-a9fd-91e67507f658"/><br/></p> | <p align="center"><img src="https://github.com/user-attachments/assets/05265eef-02e3-48f5-9f51-bd2f2a25813f"/><br/></p> |
| ---------------------------------------------------------------------------------------------| ------------------------------------------------------------------------------------- |

| <p align="center"><img src="https://github.com/user-attachments/assets/3b1d3c63-d7e7-43bd-b4ab-5e1383db21a1"/><br/></p> | <p align="center"><img src="https://github.com/user-attachments/assets/3a3f2537-c032-4525-af72-1611c0f85a3d"/><br/></p> |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |

| <p align="center"><img src="https://github.com/user-attachments/assets/e7f42e69-d9f6-4e6e-8a57-f491999d703e"/><br/></p> | <p align="center"><img src="https://github.com/user-attachments/assets/f4bd0ace-5343-4be0-8de0-d6c4f6372b52"/><br/></p> |
| ---------------------------------------------------------------------------------------------| ------------------------------------------------------------------------------------- |


