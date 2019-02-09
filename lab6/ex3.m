clearvars;
close all;
clc;

img = imread('moon.bmp');
mask = [
    0 1 0;
    1 -4 1;
    0 1 0
] / 9;
imgConv = uint8(conv2(img, mask, 'same'));
imgConvSkalowanie = imgConv + 128;
imgConvModul = abs(imgConv);

figure(1);

subplot(1, 3, 1);
imshow(img, []);
title('oryginał');

subplot(1, 3, 2);
imshow(imgConvSkalowanie, []);
title('skalowanie');

subplot(1, 3, 3);
imshow(imgConvModul, []);
title('modul');

%%

mask = fspecial('laplacian');
imgConv = uint8(conv2(img, mask, 'same'));

figure(2);

subplot(1, 3, 1);
imshow(img, []);
title('oryginał');

subplot(1, 3, 2);
imshow(imgConv, []);
title('conv');

subplot(1, 3, 3);
imshow(imabsdiff(img, imgConv), []);
title('modul');
