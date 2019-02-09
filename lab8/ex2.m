%%

clc;
clear vars;
close all;

%%

img = imread('fingerprint.bmp');

figure;

subplot(4, 1, 1);
imshow(img);

subplot(4, 1, 2);
imshow(bwmorph(img, 'thin', 1));

subplot(4, 1, 3);
imshow(bwmorph(img, 'thin', 2));

subplot(4, 1, 4);
imshow(bwmorph(img, 'thin', Inf));

%%

img = imread('kosc.bmp');

figure;

subplot(2, 1, 1);
imshow(img);

subplot(2, 1, 2);
imshow(bwmorph(img, 'skel', Inf));

%%

img = imread('text.bmp');

figure;

subplot(5, 1, 1);
imshow(img);

SE = ones(51, 1);

subplot(5, 1, 2);
imgOpen = imopen(img, SE);
imshow(imgOpen);

subplot(5, 1, 3);
marker = imerode(imgOpen, SE);
imgReconstructed = imreconstruct(marker, img);
imshow(imgReconstructed);

subplot(5, 1, 4);
imshow(imfill(imgReconstructed, 'holes'));

subplot(5, 1, 5);
imshow(imclearborder(img));



