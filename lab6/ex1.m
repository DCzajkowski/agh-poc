clearvars;
close all;
clc;

img = imread('plansza.bmp');
mask = fspecial('average');
imgConv = uint8(conv2(img, mask, 'same'));

figure(1);

subplot(1, 3, 1);
imshow(img);

subplot(1, 3, 2);
imshow(imgConv, []);

subplot(1, 3, 3);
imshow(imabsdiff(img, imgConv), []);

%% Mask

mask = [
    1, 2, 1;
    2, 4, 3;
    1, 2, 1
];
mask = mask / sum(mask);

imgConv = uint8(conv2(img, mask, 'same'));

figure(2);

subplot(1,3,1);
imshow(img);

subplot(1,3,2);
imshow(imgConv,[]);

subplot(1,3,3);
imshow(imabsdiff(img, imgConv), []);

%% Gauss 0.5

maskG = fspecial('gaussian', 5, 0.5);

figure(3);

mesh(maskG);

imgConv = uint8(conv2(img, maskG, 'same'));

figure(4);

subplot(1, 3, 1);
imshow(img);

subplot(1, 3, 2);
imshow(imgConv, []);

subplot(1, 3, 3);
imshow(imabsdiff(img, imgConv), []);

%% Gauss 0.1

maskG = fspecial('gaussian', 5, 0.1);

imgConv = uint8(conv2(img, maskG, 'same'));

figure(5);

subplot(1, 3, 1);
imshow(img);

subplot(1, 3, 2);
imshow(imgConv, []);

subplot(1, 3, 3);
imshow(imabsdiff(img, imgConv), []);

%% Gauss 50

maskG = fspecial('gaussian', 5, 50);

imgConv = uint8(conv2(img, maskG, 'same'));

figure(6);

subplot(1, 3, 1);
imshow(img);

subplot(1, 3, 2);
imshow(imgConv, []);

subplot(1, 3, 3);
imshow(imabsdiff(img, imgConv), []);
