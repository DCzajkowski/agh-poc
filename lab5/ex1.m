clc;
clearvars;
close all;

%%

img = imread('coins.png');

figure(1);

subplot(1, 3, 1);
imshow(img);

subplot(1, 3, 2);
imhist(img);

subplot(1, 3, 3);
im2bw(img, 85 / 255);

%%

figura1 = imread('figura.png');

figure(2);

subplot(2, 4, 1);
imshow(figura1);

subplot(2, 4, 2);
imhist(figura1);


figura2 = imread('figura2.png');

subplot(2, 4, 3);
imshow(figura2);

subplot(2, 4, 4);
imhist(figura2);

figura2 = imread('figura3.png');

subplot(2, 4, 5);
imshow(figura2);

subplot(2, 4, 6);
imhist(figura2);

figura3 = imread('figura4.png');

subplot(2, 4, 7);
imshow(figura3);

subplot(2, 4, 8);
imhist(figura3);

%%

figure(3);
img = imread('coins.png');
im2bw(img, graythresh(img));

%%

values = [85, 135, 150, 170, 120];

images = ["coins.png", "rice.png", "tekst.bmp", "obiekty.bmp", "katalog.bmp"];

%%

for idx = 1:5
	figure;
	img = imread(char(images(idx)));

	subplot(2, 3, 1);
	imshow(img);
	title('obraz');

	subplot(2, 3, 2);
	imhist(img);
	title('histogram');

	subplot(2, 3, 3);
	im2bw(img, values(idx) / 255);
	title(strcat('ręcznie = ', num2str(values(idx))));

	subplot(2, 3, 4);
	im2bw(img, graythresh(img));
	title(strcat('graythresh = ', num2str(graythresh(img) * 255)));

	subplot(2, 3, 5);
	im2bw(img, clusterKittler(img) / 255);
	title(strcat('Kittler = ', num2str(clusterKittler(img))));

	subplot(2, 3, 6);
	im2bw(img, entropyYen(img) / 255);
	title(strcat('Yen = ', num2str(entropyYen(img))));
end
