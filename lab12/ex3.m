close all;
clearvars;
clc;

img = imread('kolo.bmp');

img_transformed = fft2(img);
img_transformed_shifted = fftshift(img_transformed);
img_transformed_inversed_shift = ifftshift(img_transformed_shifted);
img_inversed_transform = ifft2(img_transformed_inversed_shift);

figure;
subplot(1, 3, 1);
imshow(img);
title('Obraz Oryginalny');

subplot(1, 3, 2);
imshow(img_inversed_transform);
title('Obraz po transformacie, shiftcie, odwrotnym shiftcie i odwrotnej transformacie');

subplot(1, 3, 3);
imshow(imabsdiff(double(img), img_inversed_transform));
title('Różnica obrazu oryginalnego i po zmianach');
