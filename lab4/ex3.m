clearvars;
close all;
clc;

figure(1);
lena = imread('lenaRGB.bmp');

subplot(4, 1, 1);
imshow(lena);

subplot(4, 1, 2);
R = lena(:, :, 1);
imshow(R);

subplot(4, 1, 3);
G = lena(:, :, 2);
imshow(G);

subplot(4, 1, 4);
B = lena(:, :, 3);
imshow(B);

%%

lenaEQ = lena;
lenaEQ(:, :, 1) = R;
lenaEQ(:, :, 2) = G;
lenaEQ(:, :, 3) = B;

figure(2);
subplot(2, 1, 1);
imshow(lenaEQ);

subplot(2, 1, 2);
imshow(histeq(lenaEQ, 256));

%%

lenaHSV = rgb2hsv(lena);
H = lenaHSV(:, :, 1);
S = lenaHSV(:, :, 2);
V = lenaHSV(:, :, 3);

figure(3);

subplot(3, 1, 1);
imhist(H);

subplot(3, 1, 2);
imhist(S);

subplot(3, 1, 3);
imhist(V);

figure(4);

Vadjusted = histeq(V, 256);
lena_adjusted = lenaHSV;
lena_adjusted(:, :, 1) = double(H);
lena_adjusted(:, :, 2) = double(S);
lena_adjusted(:, :, 3) = Vadjusted;

imshow(hsv2rgb(lena_adjusted));
