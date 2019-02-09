clearvars;
close all;
clc;

img = imread('lenaSzum.bmp');

imgConv = medfilt2(img);

figure(1);

subplot(1, 3, 1);
imshow(img);

subplot(1, 3, 2);
imshow(imgConv, []);

subplot(1, 3, 3);
imshow(imabsdiff(img, imgConv), []);

%%

img = imread('lena.bmp');
imgConv = img;

for i = 1:10
    imgConv = medfilt2(imgConv, [5 5]);
end

figure(2);

subplot(1, 3, 1);
imshow(img);

subplot(1, 3, 2);
imshow(imgConv, []);

subplot(1, 3, 3);
imshow(imabsdiff(img, imgConv), []);