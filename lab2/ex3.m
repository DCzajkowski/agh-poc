clearvars; close all; clc;

figure(1);
img512 = imread('lena.bmp');
imshow(img512);

figure(2);
img256 = imresize(img512, .5);
imshow(img256, 'InitialMagnification', 200);

figure(3);
img128 = imresize(img512, .25);
imshow(img128, 'InitialMagnification', 400);

figure(4);
img64 = imresize(img512, .125);
imshow(img64, 'InitialMagnification', 800); 
