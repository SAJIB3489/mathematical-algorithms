%% Exercise 10 – 5-point & 9-point Moving-Average Filters (MAF)
% Savonia – DSP
% This script:
%  1) defines the FIR filters (b1, b2), 
%  2) uses freqz to get H(w) and |H(w)|,
%  3) converts TF -> zeros/poles with tf2zpk,
%  4) plots magnitude responses and pole–zero maps.

clc; clear; close all;

%% Coefficients (unnormalized, as in the slide)
b1 = [1 1 1 1 1];          a1 = 1;        % 5-point MAF
b2 = [1 1 1 1 1 1 1 1 1];  a2 = 1;        % 9-point MAF

% If you want unit DC gain (optional), uncomment:
% b1 = b1/numel(b1);
% b2 = b2/numel(b2);

%% Frequency responses
nfft = 2048;                            % dense grid for smooth curves
[H1, w1] = freqz(b1, a1, nfft);         % w1 in rad/sample (0..pi)
[H2, w2] = freqz(b2, a2, nfft);

magH1 = abs(H1);
magH2 = abs(H2);

%% Zeros, poles, gains
[z1, p1, k1] = tf2zpk(b1, a1);
[z2, p2, k2] = tf2zpk(b2, a2);

%% Plots — magnitude responses
figure('Name','Magnitude responses','Color','w');

subplot(2,2,1);
plot(w1/pi, magH1, 'LineWidth',1.5); grid on;
xlabel('Normalized frequency  (\times\pi rad/sample)');
ylabel('|H_1(e^{j\omega})|');
title('Transfer Function of 5-point MAF');

subplot(2,2,3);
plot(w2/pi, magH2, 'LineWidth',1.5); grid on;
xlabel('Normalized frequency  (\times\pi rad/sample)');
ylabel('|H_2(e^{j\omega})|');
title('Transfer Function of 9-point MAF');

%% Plots — pole–zero maps
subplot(2,2,2);
zplane(z1, p1); axis equal;
title('Pole–zero plot of 5-point MAF');

subplot(2,2,4);
zplane(z2, p2); axis equal;
title('Pole–zero plot of 9-point MAF');

%% Console prints (handy to see the exact zeros)
disp('--- 5-point MAF ---');
disp('Zeros:'), disp(z1.'), disp('Poles:'), disp(p1.')
disp('Gain k:'), disp(k1)

disp('--- 9-point MAF ---');
disp('Zeros:'), disp(z2.'), disp('Poles:'), disp(p2.')
disp('Gain k:'), disp(k2)