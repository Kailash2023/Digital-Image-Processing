%Histogram Equalisation
%Created by Vignesh Kailash

clc;
clear all;
close all;


I = round(100 + (100 - 50) * rand(8)); % Values in the range [50, 150]


Ia = I(:)';


sortIa = sort(Ia);


[uniqueNumbers, ~, idx] = unique(sortIa); % Unique intensities and indices
frequencies = accumarray(idx, 1); % Frequency of each intensity


cumulativeFrequencies = cumsum(frequencies);


totalPixels = numel(I);


cdf_min = min(cumulativeFrequencies(cumulativeFrequencies > 0));


L = 256;


h_v = round(((cumulativeFrequencies - cdf_min) / (totalPixels - cdf_min)) * (L - 1));


equalizedImage = zeros(size(I)); % Initialize equalized image
for i = 1:length(uniqueNumbers)
    equalizedImage(I == uniqueNumbers(i)) = h_v(i);
end

equalizedImage = uint8(equalizedImage);
I = uint8(I);


figure(1);
subplot(2, 1, 1);
bar(uniqueNumbers, frequencies, 'FaceColor', 'b');
title('Original Histogram');
xlabel('Intensity Values');
ylabel('Frequency');

subplot(2, 1, 2);
bar(0:L-1, histcounts(equalizedImage(:), 0:L), 'FaceColor', 'r');
title('Equalized Histogram');
xlabel('Intensity Values');
ylabel('Frequency');

figure(2)
subplot(1,2,1)
imshow(I)
title("Original Image");

subplot(1,2,2)
imshow(equalizedImage)
title("Equalised Image");
