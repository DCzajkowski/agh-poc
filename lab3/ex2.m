%% init
clearvars; close all; clc;

subplot(3, 4, 1);
lena = imread('lena.bmp');
imshow(lena);
title('lena');

subplot(3, 4, 2);
jet = imread('jet.bmp');
imshow(jet);
title('jet');

%% 
subplot(3, 4, 3);
imshow(uint16(imadd(lena, jet)), []);
title('uint16(imadd(lena, jet)), []');

%% 
subplot(3, 4, 4);
imshow(imlincomb(1, lena, 2, jet, 'uint16'), []);
title('imlincomb(1, lena, 2, jet, uint16), []');

%% 
subplot(3, 4, 5);
imshow(imsubtract(jet, lena), []);
title('imsubtract(jet, lena), []');

subplot(3, 4, 6);
imshow(imsubtract(int16(jet), int16(lena)), []);
title('imsubtract(int16(jet), int16(lena)), []');

subplot(3, 4, 7);
imshow(imabsdiff(lena, jet), []);
title('imabsdiff(lena, jet), []');

%% 
subplot(3, 4, 8);
imshow(immultiply(lena, jet));
title('immultiply(lena, jet)');

subplot(3, 4, 9);
imshow(immultiply(lena, 2));
title('immultiply(lena, 2)');

subplot(3, 4, 10);
imshow(immultiply(lena, boolean(imread('kolo.bmp'))));
title('immultiply(lena, boolean(imread(kolo.bmp)))');

%% 
subplot(3, 4, 11);
imshow(imcomplement(lena));
title('imcomplement(lena)');
