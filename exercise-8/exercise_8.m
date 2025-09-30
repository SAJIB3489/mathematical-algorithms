clc;
clear all;
close all;

% Assign Time vector t from 0 to 100 with increment 100/(10-1)
Fs = 100;                          % Sampling frequency (Hz)
t  = 0:1/Fs:10-1/Fs;               % 0:0.01:9.99 (length 1000)

% write the given Signal x = ....
x = sin(2*pi*15*t) + sin(2*pi*40*t);

%subplot function
figure;
subplot(3,1,1);
plot(t,x);
grid on;
title('Given Original Signal')
xlabel('Time, s')

%Compute the DFT of the signal and the magnitude and phase of the transformed sequence. 
%Decrease round-off error when computing the phase by setting small-magnitude transform 
%values to zero.

% Compute DFT of x with single parameter of fft function and assign as y
y = fft(x);                       

% Magnitude of y is m
m = abs(y);

y(m<1e-6) = 0;                    % Zero very small components
p = unwrap(angle(y));             % Phase (radians)

%To plot the magnitude and phase in degrees, type the following commands:
f = (0:length(y)-1)*Fs/length(y); % Frequency vector

%subplot function
subplot(3,1,2);
plot(f,m)
grid on;
title('Magnitude')
xlabel('Frequency, Hz')
ax = gca;
ax.XTick = [15 40 60 85];

% subplot function
subplot(3,1,3);
plot(f,p*180/pi)
grid on;
title('Phase')
xlabel('Frequency, Hz')
ax = gca;
ax.XTick = [15 40 60 85];