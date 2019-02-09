close all;
clearvars;
clc;

img = zeros(11);

figure(1);

img(6, 6) = 1;
[H, theta, rho] = hough(img, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

imshow(H, []);


figure(2);

img(1, 8) = 1;
img(8, 1) = 1;
img(8, 8) = 1;
img(9, 9) = 1;
[H2, theta2, rho2] = hough(img, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);


imshow(H2, []);


X = 91;
Y = 143;
p = rho(Y);
O = theta(X);


x = 0:0.1:10;
y = (p - x * cosd(O)) / sind(O);

figure(3);

imshow(img);
hold on;
plot(x + 1, y + 1);
hold off;

