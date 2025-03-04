
%discrete wavelet transform
%created by Revanth
clc;
clear all;
close all;

% Read the image
img = imread('https://img.itch.zone/aW1nLzU5MzA1MjEucG5n/original/P4Vv%2Bh.png');

% Convert to grayscale if it's an RGB image
if size(img, 3) == 3
    gray_img = rgb2gray(img);
else
    gray_img = img;
end

% Resize the image
gray_img = imresize(gray_img, [512, 512]);

% Convert to double for DWT
gray_img = im2double(gray_img);

% Perform 2D Discrete Wavelet Transform using Haar wavelet
[LL, LH, HL, HH] = dwt2(gray_img, 'haar');

% Display the results
figure;
subplot(2,2,1);
imshow(LL, []);
title('LL');

subplot(2,2,2);
imshow(LH, []);
title('LH');

subplot(2,2,3);
imshow(HL, []);
title('HL');

subplot(2,2,4);
imshow(HH, []);
title('HH');
