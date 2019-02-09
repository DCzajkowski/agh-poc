%%

clearvars;
close all;
clc;

lena1 = imread('lena1.bmp');
lena2 = imread('lena2.bmp');
lena3 = imread('lena3.bmp');
lena4 = imread('lena4.bmp');

figure(1);
subplot(2,4,1);
imshow(lena1);
subplot(2,4,5);
imhist(lena1, 256);

subplot(2,4,2);
imshow(lena2);
subplot(2,4,6);
imhist(lena2, 256);

subplot(2,4,3);
imshow(lena3);
subplot(2,4,7);
imhist(lena3, 256);

subplot(2,4,4);
imshow(lena4);
subplot(2,4,8);
imhist(lena4, 256);

%%

figure(2);
image = imread('hist1.bmp');

subplot(1,2,1);
imshow(image);

subplot(1,2,2);
imhist(image, 256);

%%

figure(3);
image_adjusted = imadjust(image);

subplot(1,2,1);
imshow(image_adjusted);

subplot(1,2,2);
imhist(image_adjusted, 256);

%% histogram skumulowany

figure(4);
[H, x] = imhist(lena1, 256);
C = cumsum(H);
k = max(C) / max(H);
C2 = C / k;
subplot(1, 2, 1);
imshow(lena1);
subplot(1, 2, 2);
hold on;
plot(x, H);
plot(x, C2);


figure(5);
j = max(C2) / 255;
I = C2 / j;
lena_intlut = intlut(lena1, uint8(I));

[H2, x2] = imhist(lena_intlut);
C3 = cumsum(H2);
k2 = max(C3) / max(H2);
C4 = C3 / k2;
subplot(1, 2, 1);
imshow(lena_intlut);
subplot(1, 2, 2);
hold on;
plot(x2, H2);
plot(x2, C4);


%%

figure(6);
img = imread('hist1.bmp');
img_adjusted = imadjust(img);

subplot(2, 4, 1);
imshow(img);

subplot(2, 4, 2);
imshow(img_adjusted);

subplot(2, 4, 3);
imhist(histeq(img, 256));

subplot(2, 4, 4);
imhist(histeq(img_adjusted, 256));

subplot(2, 4, 5);
imhist(adapthisteq(img));

subplot(2, 4, 6);
imhist(adapthisteq(img_adjusted));

%%

for i = 2:4
    figure;
    img = imread(strcat('hist',  num2str(i), '.bmp'));
    img_adjusted = imadjust(img);

    subplot(2, 4, 1);
    imshow(img);

    subplot(2, 4, 2);
    imshow(img_adjusted);

    subplot(2, 4, 3);
    imhist(histeq(img, 256));

    subplot(2, 4, 4);
    imhist(histeq(img_adjusted, 256));

    subplot(2, 4, 5);
    imhist(adapthisteq(img));

    subplot(2, 4, 6);
    imhist(adapthisteq(img_adjusted));
end


