%%

clc;
clear vars;
close all;

%%

img = imread('ertka.bmp');

element_strukturalny = strel('square', 3);


imgEroded = imerode(img, element_strukturalny);


figure(1);
subplot(2, 1, 1);
imshow(img);

subplot(2, 1, 2);
imshow(imgEroded);

imgEroded = imerode(imgEroded, element_strukturalny);

figure(2);
subplot(2, 1, 1);
imshow(img);

subplot(2, 1, 2);
imshow(imgEroded);


imgEroded = imerode(imgEroded, element_strukturalny);

figure(3);
subplot(2, 1, 1);
imshow(img);

subplot(2, 1, 2);
imshow(imgEroded);


%%


img = imread('buzka.bmp');

element_strukturalny = [0 1; 1 0];
imgEroded = imerode(img, element_strukturalny);


figure(1);
subplot(2, 1, 1);
imshow(img);

subplot(2, 1, 2);
imshow(imgEroded);


%%
imgs = [
"ertka.bmp" "wyspa.bmp" "kolka.bmp"
];

for i = 1:3
figure;

img = imread(char(imgs(i)));
element_strukturalny = strel('square', 3);
subplot(2, 2, 1);
imshow(img);

subplot(2, 2, 2);
imshow(imdilate(img, element_strukturalny));
title('imdilate');

subplot(2, 2, 3);
imshow(imopen(img, element_strukturalny));
title('imopen');

subplot(2, 2, 4);
imshow(imclose(img, element_strukturalny));
title('imclose');
end


%%

el = strel('square', 3);

figure;
x = imread('ertka.bmp');
x = imopen(x, el);
x = imclose(x, el);
imshow(x);


%%

img = imread('hom.bmp');
SE1 = [0 1 0; 1 1 1; 0 1 0];
SE2 = [1 0 1; 0 0 0; 1 0 1];

figure;

subplot(2, 1, 1);
imshow(img);

subplot(2, 1, 2);
imshow(bwhitmiss(img, SE1, SE2));