clearvars; close all; clc;

img = imread('lena.bmp');
img = imresize(img, .25);

figure(1);

subplot(3, 2, 1);
imshow(imadjust(img, [0 1], [0 31/255]), []);

subplot(3, 2, 2);
imshow(imadjust(img, [0 1], [0 15/255]), []);

subplot(3, 2, 3);
imshow(imadjust(img, [0 1], [0 7/255]), []);

subplot(3, 2, 4);
imshow(imadjust(img, [0 1], [0 3/255]), []);

subplot(3, 2, 5);
imshow(imadjust(img, [0 1], [0 1/255]), []);
