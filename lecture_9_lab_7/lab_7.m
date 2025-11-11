%Md Sajib Pramanic
%Lab 7

%% --- 1. Load Image and Add Noise ---
originalImage = imread('cameraman.tif');

% Convert to RGB for CNNs that require 3 channels
if size(originalImage,3) == 1
    originalImage = repmat(originalImage, [1 1 3]);
end

% Add Gaussian noise
noiseSigma = 0.04;
noisyImage = imnoise(im2double(originalImage), 'gaussian', 0, noiseSigma^2);


%% --- 2. Traditional Preprocessing (Wiener + Contrast Adjust) ---
grayNoisy = rgb2gray(noisyImage);
wienerFiltered = wiener2(grayNoisy, [5 5]);
traditionalPreprocessed = imadjust(wienerFiltered);
traditionalPreprocessed = repmat(traditionalPreprocessed, [1 1 3]);


%% --- 3. AI Denoising Using DnCNN ---
netDnCNN = denoisingNetwork('DnCNN');
aiDenoised = denoiseImage(rgb2gray(noisyImage), netDnCNN);
aiDenoised = repmat(aiDenoised, [1 1 3]);


%% --- 4. Resize for CNN Classification (AlexNet Expected Size = 227x227) ---
inputSize = [227 227];

rawInput = imresize(noisyImage, inputSize);
tradInput = imresize(traditionalPreprocessed, inputSize);
aiInput   = imresize(aiDenoised, inputSize);


%% --- 5. Load Pre-Trained Classification CNN ---
net = alexnet;


%% --- 6. Classify Images ---
labelRaw  = classify(net, rawInput);
labelTrad = classify(net, tradInput);
labelAI   = classify(net, aiInput);


%% --- 7. Display Results ---
figure('Name','Effect of Preprocessing on CNN Classification');
subplot(1,4,1); imshow(originalImage); title('Original Image');
subplot(1,4,2); imshow(rawInput);  title(['Raw → CNN: ', char(labelRaw)]);
subplot(1,4,3); imshow(tradInput); title(['Traditional → CNN: ', char(labelTrad)]);
subplot(1,4,4); imshow(aiInput);   title(['AI (DnCNN) → CNN: ', char(labelAI)]);


%% --- 8. Print Comparison ---
fprintf('\n=== CNN Classification Results ===\n');
fprintf('Raw Noisy Image:            %s\n', char(labelRaw));
fprintf('Traditional Preprocessed:   %s\n', char(labelTrad));
fprintf('AI (DnCNN) Denoised:        %s\n\n', char(labelAI));

disp('Observation:');
disp('The CNN usually performs better when the image is preprocessed,');
disp('and AI-based denoising (DnCNN) typically preserves details better,');
disp('leading to more accurate classification than traditional filtering alone.');
