
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



## Features



<p align="center">
  <img src="/attachment/login.png" alt="Microsoft Login" title="Microsoft Login">
</p>

| <p align="center"><img src="/attachment/image.png"/><br/>Images</p> | <p align="center"><img src="/attachment/container.png"/><br/>Containers</p> |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |

| <p align="center"><img src="/attachment/container_logs.png"/><br/>Container Logs</p> | <p align="center"><img src="/attachment/cleanup.png"/><br/>Clean-up</p> |
| ---------------------------------------------------------------------------------------------| ------------------------------------------------------------------------------------- |

| <p align="center"><img src="/attachment/ubuntu_home.png"/><br/>Container GUI</p> | <p align="center"><img src="/attachment/gazebo_rviz1.png"/><br/>Simulation Gazebo Rviz</p> | <p align="center"><img src="/attachment/gpu_usages.png"/><br/>GPU Usages</p> |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |

| <p align="center"><img src="/attachment/admin_login.png"/><br/>Admin Login</p> | <p align="center"><img src="/attachment/user_information.png"/><br/>Active User Information</p> | <p align="center"><img src="/attachment/database.png"/><br/>SQLite Database and Datastore</p> |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
