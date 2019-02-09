%%

clc;
clear vars;
close all;

img = imread('dom.png');

figure(1);

subplot(1, 4, 1);
imshow(img);
title('img');

subplot(1, 4, 2);
imshow(edge(img, 'log'));
title('log');

subplot(1, 4, 3);
imshow(edge(img, 'canny'));
title('canny');

subplot(1, 4, 4);
imshow(edge(img, 'sobel'));
title('sobel');



figure(2);

subplot(1, 4, 1);
imshow(img);
title('img');

subplot(1, 4, 2);
imshow(edge(img, 'log', 0.01));
title('log');

subplot(1, 4, 3);
imshow(edge(img, 'canny', [0.19, 0.2]));
title('canny');

subplot(1, 4, 4);
imshow(edge(img, 'sobel', 0.15));
title('sobel');
