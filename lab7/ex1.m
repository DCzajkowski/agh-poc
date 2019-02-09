clearvars;
close all;
clc;

load('MR_data.mat');

local_window = [3, 3];

%%

figure(1);

subplot(5, 3, 1);
imshow(uint8(I_noisefree));
title('Inoisefree');

subplot(5, 3, 2);
imshow(uint8(convolution(I_noisefree, local_window)));
title('convolution(Inoisefree, localwindow)');

subplot(5, 3, 3);
imshow(uint8(bilateral(I_noisefree, local_window)));
title('bilateral(Inoisefree, localwindow)');

subplot(5, 3, 4);
imshow(uint8(I_noisy1));
title('Inoisy1');

subplot(5, 3, 5);
imshow(uint8(convolution(I_noisy1, local_window)));
title('convolution(Inoisy1, localwindow)');

subplot(5, 3, 6);
imshow(uint8(bilateral(I_noisy1, local_window)));
title('bilateral(Inoisy1, localwindow)');

subplot(5, 3, 7);
imshow(uint8(I_noisy2));
title('Inoisy2');

subplot(5, 3, 8);
imshow(uint8(convolution(I_noisy2, local_window)));
title('convolution(Inoisy2, localwindow)');

subplot(5, 3, 9);
imshow(uint8(bilateral(I_noisy2, local_window)));
title('bilateral(Inoisy2, localwindow)');

subplot(5, 3, 10);
imshow(uint8(I_noisy3));
title('Inoisy3');

subplot(5, 3, 11);
imshow(uint8(convolution(I_noisy3, local_window)));
title('convolution(Inoisy3, localwindow)');

subplot(5, 3, 12);
imshow(uint8(bilateral(I_noisy3, local_window)));
title('bilateral(Inoisy3, localwindow)');

%%

subplot(5, 3, 13);
imshow(uint8(I_noisy4));
title('Inoisy4');

subplot(5, 3, 14);
imshow(uint8(convolution(I_noisy4, local_window)));
title('convolution(Inoisy4, localwindow)');

subplot(5, 3, 15);
imshow(uint8(bilateral(I_noisy4, local_window)));
title('bilateral(Inoisy4, localwindow)');

%%

figure(2);

subplot(1, 3, 1);
imshow(uint8(I_noisy1));
title('Inoisy1');

subplot(1, 3, 2);
imshow(uint8(convolution(I_noisy1, local_window)));
title('convolution(Inoisy1, localwindow)');

subplot(1, 3, 3);
imshow(uint8(bilateral(I_noisy1, local_window)));
title('bilateral(Inoisy1, localwindow)');
