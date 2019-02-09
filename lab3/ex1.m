clearvars; close all; clc;

load funkcjeLUT;

figure(1);
plot(kwadratowa);

figure(2);
img = imread('lena.bmp');
imshow(img);

figure(3);
imshow(intlut(img, kwadratowa));

%%

figure('Name', 'Kwadratowa');
LUT(img, kwadratowa);

figure('Name', 'Log');
LUT(img, log);

figure('Name', 'Odwlog');
LUT(img, odwlog);

figure('Name', 'Odwrotna');
LUT(img, odwrotna);

figure('Name', 'Pierwiastkowa');
LUT(img, pierwiastkowa);

figure('Name', 'Pila');
LUT(img, pila);

figure('Name', 'Wykladnicza');
LUT(img, wykladnicza);
