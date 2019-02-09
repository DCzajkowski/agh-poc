%% Simple display

figure(1);
i = imread('lena.jpg');
imshow(i);

figure(2);
i = imread('lena.bmp');
imshow(i);

figure(3);
j = rgb2gray(i);
imshow(j);

imwrite(j, 'lena_gray.bmp')

% clearvars;
% close all;

%% Grayscale and mesh function
colormap gray;

figure(4);
mesh(j);

%% Modification and analysis

figure(5);
plot(j(10,:)) % x - row nr, y - col nr

figure(6);
plot(j(:,5))










