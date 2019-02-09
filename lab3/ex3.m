clearvars; close all; clc;

kolo = boolean(imread('kolo.bmp'));
kwadrat = boolean(imread('kwadrat.bmp'));

subplot(7, 1, 1);
imshow(kolo);
title('kolo');

subplot(7, 1, 2);
imshow(kwadrat);
title('kwadrat');

subplot(7, 1, 3);
imshow(~ kwadrat);
title('~ kwadrat');

subplot(7, 1, 4);
imshow(~ kolo);
title('~ kolo');

subplot(7, 1, 5);
imshow(kwadrat & kolo);
title('kwadrat & kolo');

subplot(7, 1, 6);
imshow(kwadrat | kolo);
title('kwadrat | kolo');

subplot(7, 1, 7);
imshow(xor(kwadrat, kolo));
title('xor(kwadrat, kolo)');