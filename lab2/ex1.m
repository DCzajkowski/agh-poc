clearvars; close all; clc;

parrot = imread('lena.bmp');
figure(1);
imshow(parrot);

xReScale = 2.5;
yReScale = 2.5;

[YY, XX] = size(parrot);

nYY = round(YY * yReScale);
nXX = round(XX * xReScale);
nParrot = uint8(zeros(nYY, nXX));

xStep = XX / nXX;
yStep = YY / nYY;

for y = 0:(nYY-1)
   for x = 0:(nXX-1)
       nX = round(x * xStep);
       nY = round(y * yStep);
       
       if nY > YY - 1
           nY = YY - 1;
       end
   
       if nX > XX - 1
           nX = XX - 1;
       end

       nParrot(y + 1, x + 1) = parrot(nY + 1, nX + 1);
   end
end

figure(2);
imshow(nParrot);









