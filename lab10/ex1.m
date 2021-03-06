close all;
clearvars;
clc;

img = imread('knee.png');

%% Read input

figure(1);

imshow(img);

[y, x] = ginput(1);
x = floor(x);
y = floor(y);
% x = 332;
% y = 252;


%% Prepare image

imgCopy = img;
img = double(img);
img = imfilter(img, fspecial('gaussian'));


%% Assign helper matricies


[width, height] = size(img);

visited = zeros(width, height);
segmented = zeros(width, height);
stack = zeros(10000, 2);

iStack = 1;

stack(iStack, 1) = x;
stack(iStack, 2) = y;
visited(x, y) = 1;
segmented(x, y) = 1;

prog = 10;

srednia = 0; % średnia jasność w wyznaczonym obszarze
licznik_pikseli = 0; % licznik pikseli należących do obiektu

figure(2);
hold on;

z = 0;

while iStack > 0
    % Wyświetlanie na bieżąco
    if (mod(z, 500) == 0)
        imgCopy(segmented > 0) = 255;
        imshow(imgCopy);
        drawnow;
    end

    % Pobranie pixela ze stosu
    pixelX = stack(iStack, 1);
    pixelY = stack(iStack, 2);
    iStack = iStack - 1;
    licznik_pikseli = licznik_pikseli + 1;

    % Wyrzucenie z obliczeń brzegu
    if (pixelX + 1 >= width || pixelX - 1 <= 0 || pixelY + 1 >= height || pixelY - 1 <= 0)
        continue
    end
    
    for i = -1:1
        for j = -1:1
            if i == 0 && j == 0
               continue 
            end

            srednia = (srednia * (licznik_pikseli - 1) + img(pixelX, pixelY)) / licznik_pikseli;

            modul_roznicy_jasnosci = abs(srednia - img(pixelX + i, pixelY + j));

            if (modul_roznicy_jasnosci < prog && visited(pixelX + i, pixelY + j) == 0) %% mniejszy od progu i nie odwiedzony
                segmented(pixelX + i, pixelY + j) = 1;
                iStack = iStack + 1;
                stack(iStack, 1) = pixelX + i;
                stack(iStack, 2) = pixelY + j;
            end

            visited(pixelX + i, pixelY + j) = 1;
        end
    end
    
    z = z + 1;
end

figure(3);
imshow(segmented);



