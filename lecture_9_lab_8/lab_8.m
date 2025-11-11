%Md Sajib Pramanic
%Lab 8 Hybrid Traditional + AI Pipeline with Comparison

close all; clear; clc;

% ---------------------------------------------------
% Section 1: Load Image and AI Network
% ---------------------------------------------------
targetImage = imread('peppers.png'); % Sample image
disp('Loading pre-trained AI network (SqueezeNet)...');
net = squeezenet;
disp('Network loaded.');

figure('Name', 'Hybrid Pipeline Comparison');
subplot(2,3,1); imshow(targetImage); title('Original Image');

% ---------------------------------------------------
% Section 2: Baseline AI Classification (Original Image)
% ---------------------------------------------------
inputSize = net.Layers(1).InputSize;
resizedOriginal = imresize(targetImage, [inputSize(1) inputSize(2)]);
[YPredOriginal, probsOriginal] = classify(net, resizedOriginal);
subplot(2,3,2); imshow(resizedOriginal); title('Original Image to AI');
fprintf('\n--- Baseline Classification ---\n');
fprintf('Original Image classified as: %s (Confidence: %.2f%%)\n', ...
    string(YPredOriginal), max(probsOriginal)*100);

% ---------------------------------------------------
% Section 3: Traditional Method (K-Means Segmentation)
% ---------------------------------------------------
disp('Applying traditional color segmentation (K-Means)...');
imgLab = rgb2lab(targetImage);
ab = im2single(imgLab(:,:,2:3));
pixelLabels = imsegkmeans(ab, 2); % Cluster into 2 colors

mask = pixelLabels == 2; % Assume Cluster 2 is the object
isolatedObject = targetImage;
isolatedObject(repmat(~mask,1,1,3)) = 0; % Mask background
subplot(2,3,3); imshow(mask); title('Traditional Mask (K-Means)');
subplot(2,3,4); imshow(isolatedObject); title('Isolated Object');

% ---------------------------------------------------
% Section 4: AI Classification on Isolated Object
% ---------------------------------------------------
resizedObject = imresize(isolatedObject, [inputSize(1), inputSize(2)]);
[YPredHybrid, probsHybrid] = classify(net, resizedObject);
subplot(2,3,5); imshow(resizedObject); title('Input to AI (Hybrid)');

% ---------------------------------------------------
% Section 5: Quantitative & Visual Analysis
% ---------------------------------------------------
fprintf('\n--- Hybrid Pipeline Classification ---\n');
fprintf('Isolated Object classified as: %s (Confidence: %.2f%%)\n', ...
    string(YPredHybrid), max(probsHybrid)*100);

fprintf('\n--- Comparison ---\n');
fprintf('Original Image -> AI: %s (%.2f%%)\n', string(YPredOriginal), max(probsOriginal)*100);
fprintf('Hybrid (Traditional + AI) -> AI: %s (%.2f%%)\n', string(YPredHybrid), max(probsHybrid)*100);

disp('Observation: Traditional segmentation helps the AI focus on the main object, often improving classification confidence and accuracy.');
