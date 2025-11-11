%Md Sajib Pramanic
%Lab 7

% --- 1. Setup: Load an image and add Gaussian noise ---
originalImage = im2double(imread('cameraman.tif'));
noiseSigma = 0.04;    % Standard deviation of Gaussian noise
noisyImage = imnoise(originalImage, 'gaussian', 0, noiseSigma^2);

figure('Name', 'Noise and Filter Comparison');
subplot(2,4,1); imshow(originalImage); title('Original');
subplot(2,4,2); imshow(noisyImage); title('Gaussian Noisy');

% --- 2. Apply Traditional Filters ---

% Mean Filter (3×3 averaging)
meanFiltered = imfilter(noisyImage, fspecial('average', [3 3]));
subplot(2,4,3); imshow(meanFiltered); title('Mean Filter');

% Median Filter (3×3)
medianFiltered = medfilt2(noisyImage, [3 3]);
subplot(2,4,4); imshow(medianFiltered); title('Median Filter');

% Gaussian Filter (σ = 1)
gaussianFiltered = imgaussfilt(noisyImage, 1);
subplot(2,4,5); imshow(gaussianFiltered); title('Gaussian Blur');

% --- 3. AI Filter (Pre-trained DnCNN) ---
net = denoisingNetwork('DnCNN');
aiFiltered = denoiseImage(noisyImage, net);
subplot(2,4,6); imshow(aiFiltered); title('AI (DnCNN)');

% --- 4. Compute MSE, PSNR, SSIM ---

methods = {"Noisy", "Mean", "Median", "Gaussian Blur", "AI (DnCNN)"};
images = {noisyImage, meanFiltered, medianFiltered, gaussianFiltered, aiFiltered};

fprintf('\n--- Image Quality Metrics ---\n');
fprintf('Method\t\t MSE\t\t PSNR\t SSIM\n');
fprintf('-------------------------------------------------\n');

for i = 1:length(images)
    mseVal = immse(images{i}, originalImage);
    psnrVal = psnr(images{i}, originalImage);
    ssimVal = ssim(images{i}, originalImage);
    fprintf('%-12s %.5f\t %.3f\t %.4f\n', methods{i}, mseVal, psnrVal, ssimVal);
end

% --- End of Lab 7 ---