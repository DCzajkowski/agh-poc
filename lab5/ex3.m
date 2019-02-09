clc;
clearvars;
close all;

img = imread('bart.bmp');

subplot(1, 4, 1);
imshow(img);

subplot(1, 4, 2);
imhist(img);

obrazBW = img > 180 & img < 210;
% obrazBW = uint8(obrazBW, []);

subplot(1, 4, 3); 
imshow(obrazBW);

subplot(1, 4, 4);
imhist(obrazBW);
