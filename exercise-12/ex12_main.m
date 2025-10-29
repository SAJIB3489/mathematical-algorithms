% Exercise 12 - Results
% Md Sajib Pramanic
% Design and Analysis of FIR Low-Pass Filters Using the Sinc Function

clear; clc; close all;

% Filter settings
M_values = [20, 64];    % Different filter lengths to observe effect on response
wc = 1;                 % Cutoff frequency (radians/sample)
N_fft = 1024;           % Number of points for frequency response calculation

% Initialize storage for indices, impulse responses, and frequency responses
n_values = cell(1, length(M_values));
h_LP_values = cell(1, length(M_values));
H_LP_values = cell(1, length(M_values));

% Determine script directory and prepare folder for saving figures
scriptDir = fileparts(mfilename('fullpath'));
figDir = fullfile(scriptDir, 'figures');

% Create a directory for figures if it doesn't already exist
if ~exist(figDir, 'dir')
    mkdir(figDir);
end

% Loop through each filter order to calculate responses and plot
for idx = 1:length(M_values)
    M = M_values(idx);
    n = 0:M; % Sample indices
    n_values{idx} = n;

    % Compute ideal low-pass FIR filter using sinc function
    h_LP = sin(wc * (n - M/2)) ./ (pi * (n - M/2)); % Handle normal case
    h_LP(n == M/2) = wc / pi;                       % Handle the center (divide-by-zero)
    h_LP_values{idx} = h_LP;

    % Compute FFT to obtain frequency response
    H_LP = fft(h_LP, N_fft);
    H_LP_values{idx} = H_LP;

    % -----------------------------
    % Plot the impulse response
    % -----------------------------
    figure;
    stem(n, h_LP, 'filled'); 
    grid on;
    title(sprintf('Impulse Response h_{LP}(n) for M = %d', M));
    xlabel('Sample index n');
    ylabel('h_{LP}(n)');
    saveas(gcf, fullfile(figDir, sprintf('hLP_M%d.png', M)));

    % -----------------------------
    % Plot the magnitude response
    % -----------------------------
    w = linspace(-pi, pi, N_fft);
    figure;
    plot(w/pi, abs(fftshift(H_LP)), 'LineWidth', 1.2);
    grid on;
    title(sprintf('Magnitude Response |H_{LP}(e^{jω})| for M = %d', M));
    xlabel('Normalized Frequency ω/π');
    ylabel('|H_{LP}|');
    saveas(gcf, fullfile(figDir, sprintf('HLP_M%d.png', M)));
end

% -----------------------------
% Compare magnitude responses for both filter lengths
% -----------------------------
figure;
hold on;
w = linspace(-pi, pi, N_fft);
for idx = 1:length(M_values)
    plot(w/pi, abs(fftshift(H_LP_values{idx})), 'LineWidth', 1.2, ...
        'DisplayName', sprintf('M = %d', M_values(idx)));
end
grid on;
title('Magnitude Responses Comparison for Different Filter Orders');
xlabel('Normalized Frequency ω/π');
ylabel('|H_{LP}|');
legend show;
saveas(gcf, fullfile(figDir, 'HLP_compare.png'));

disp('All plots have been generated and saved.');
