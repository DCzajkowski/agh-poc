%%

clc;
clear vars;
close all;

%%

img = imread('ferrari.bmp');
SE = strel('square', 3);


figure(1);

subplot(7, 1, 1);
imshow(img);

subplot(7, 1, 2);
imshow(imerode(img, SE));

subplot(7, 1, 3);
imshow(imdilate(img, SE));

subplot(7, 1, 4);
imshow(imabsdiff(img, imerode(img, SE)));

subplot(7, 1, 5);
imshow(imabsdiff(img, imdilate(img, SE)));

subplot(7, 1, 6);
imshow(imopen(img, SE));

subplot(7, 1, 7);
imshow(imclose(img, SE));

%%

figure(2);

subplot(1, 3, 1);
imshow(imtophat(img, SE));

subplot(1, 3, 2);
imshow(imbothat(img, SE));

subplot(1, 3, 3);
imshow(img);

%%

figure(3);

img = imread('rice.png');

subplot(1, 2, 1);
imshow(img);

subplot(1, 2, 2);
imshow(imtophat(img, strel('disk', 10)));