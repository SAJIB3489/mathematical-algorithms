% Exercise 11 - Results
% Md Sajib Pramanic
% FIR Filter Types - Magnitude, Phase, and Pole-Zero Diagrams

% Define the impulse responses for FIR filter types I-IV
h1 = [1 2 3 4 4 3 2 1];     % FIR Type I  (M even, symmetric) - Linear phase, non-zero at both ends
h2 = [1 2 3 4 3 2 1];       % FIR Type II (M odd, symmetric) - Linear phase, zero at Nyquist possible
h3 = [-1 -2 -3 -4 3 3 2 1]; % FIR Type III (M even, antisymmetric) - Linear phase, zero at DC
h4 = [-1 -2 -3 0 3 2 1];    % FIR Type IV (M odd, antisymmetric) - Linear phase, zero at DC and Nyquist

% Create a figure for the plots
figure;

% Define a cell array for the filters and their titles
filters = {h1, h2, h3, h4};
titles = {'FIR Type I', 'FIR Type II', 'FIR Type III', 'FIR Type IV'};

for i = 1:length(filters)
    h = filters{i};
    
    % Compute frequency response
    [H, w] = freqz(h, 1, 512);  % freqz computes frequency response H(w) of FIR filter
    
    % Magnitude response
    subplot(4, 3, (i-1)*3 + 1);
    plot(w/pi, abs(H));          % Plot normalized frequency vs magnitude
    title([titles{i} ' - Magnitude']);
    xlabel('Normalized Frequency (\times \pi rad/sample)');
    ylabel('Magnitude');
    grid on;

    % Phase response
    subplot(4, 3, (i-1)*3 + 2);
    plot(w/pi, unwrap(angle(H))); % Plot phase response and unwrap to remove discontinuities
    title([titles{i} ' - Phase']);
    xlabel('Normalized Frequency (\times \pi rad/sample)');
    ylabel('Phase (radians)');
    grid on;

    % Zero-Pole plot
    subplot(4, 3, (i-1)*3 + 3);
    zplane(h, 1);                 % Display zeros and poles in z-plane
    title([titles{i} ' - Zero-Pole']);
    grid on;
end

% Adjust layout
sgtitle('FIR Filter Types - Magnitude, Phase, and Zero-Pole Diagrams');  % Overall title for the figure
