clc;
clear all;
close all;

% Original setup
Fs = 100;                          % Sampling frequency (Hz)
t  = 0:1/Fs:10-1/Fs;               % Time vector (0 to 10 s, step 0.01 s)
x  = sin(2*pi*15*t) + sin(2*pi*40*t);  % Original signal

% Using fft with length argument (zero-padding)
n = 512;
y = fft(x, n);

% Magnitude and phase (reduce round-off effects for tiny bins)
m = abs(y);
y(m < 1e-6) = 0;
p = unwrap(angle(y));

% Frequency vector (0 to Fs*(n-1)/n)
f = (0:length(y)-1) * Fs/length(y);

% Plots
figure;
subplot(2,1,1);
plot(f, m);
grid on;
title('Magnitude');
xlabel('Frequency, Hz');
ax = gca; ax.XTick = [15 40 60 85]; xlim([0 Fs]);

subplot(2,1,2);
plot(f, p*180/pi);
grid on;
title('Phase');
xlabel('Frequency, Hz');
ax = gca; ax.XTick = [15 40 60 85]; xlim([0 Fs]);