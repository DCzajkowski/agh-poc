close all;
clearvars;
clc;

img = imread('shapes.png');

figure(1);
imshow(img, []);

img2 = bwlabel(img, 4);
shapes = obliczWspolczynniki(img2);
[sizeY, sizeX] = size(img2);

for y = 1:sizeY
    for x = 1:sizeX
        piksel = img2(y, x);

        if (piksel ~= 0 && ~(shapes(piksel, 2) > 0.3 && shapes(piksel, 2) < 0.6))
            img2(y, x) = 0;
        end
    end
end

figure(2);
imshow(img2);

img = imerode(imcomplement(im2bw(imread('shapesReal.png'), 0.22)), strel('rectangle', [5 5]));

figure(3);
imshow(img);

img2 = bwlabel(img, 4);

figure(4);
imshow(label2rgb(img2));

shapes = obliczWspolczynniki(img2);

[sizeY,  sizeX] = size(img2);

for y = 1:sizeY
    for x = 1:sizeX
        piksel = img2(y, x);

        if (piksel ~= 0 && ~(shapes(piksel, 1) > 0.50 && shapes(piksel, 5) < 0.010 && shapes(piksel, 2) < 0.9))
            img2(y, x) = 0;
        end
    end
end

figure(5);
imshow(img2);
