close all;
clearvars;
clc;

img = imread('ccl2.png');

figure(1);
imshow(img, []);

figure(2);
imshow(label2rgb(bwlabel(img, 4)), []);

figure(3);
imshow(label2rgb(bwlabel(img, 8)), []);