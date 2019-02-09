%%

clearvars;
close all;
clc;

load histogramZadany;

figure(1);
img = imread('phobos.bmp');

subplot(2, 3, 1);
imshow(img);

subplot(2, 3, 2);
imshow(histeq(img, 256));

subplot(2, 3, 3);
imshow(histeq(img, histogramZadany));

subplot(2, 3, 4);
imhist(img);

subplot(2, 3, 5);
imhist(histeq(img, 256));

subplot(2, 3, 6);
imhist(histeq(img, histogramZadany));

%%

figure(2);
img_adjusted = imadjust(img);

subplot(2, 2, 1);
imshow(img_adjusted);

subplot(2, 2, 2);
imhist(img_adjusted);

subplot(2, 2, 3);
imshow(adapthisteq(img_adjusted));

subplot(2, 2, 4);
imhist(adapthisteq(img_adjusted));