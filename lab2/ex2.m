clearvars; close all; clc;

img = imread('clock.bmp');
figure(1);
imshow(img);
img = double(img);

xReScale = .5;
yReScale = .5;

[yOld, xOld] = size(img);

yNew = round(yOld * yReScale);
xNew = round(xOld * xReScale);
imgNew = uint8(zeros(yNew, xNew));

xStep = xOld / xNew;
yStep = yOld / yNew;

for y = 0:(yNew-1)
    yA = floor(y * yStep);
    
    if yA > yOld - 2
        yA = yOld - 2;
    end
    
    yB = yA + 1;
    yC = yA + 1;
    yD = yA;
    
    for x = 0:(xNew-1)
        xA = floor(xStep * x);
        
        if xA > xOld - 2 
            xA = xOld - 2;
        end
        
        xB = xA;
        xC = xA + 1;
        xD = xA + 1;
        
        yABCD = y * yStep - yA;
        xABCD = x * xStep - xA;
        
        imgNew(y + 1, x + 1) = [
            1 - yABCD yABCD
        ] * [
            img(yA + 1, xA + 1) img(yD + 1, xD + 1); 
            img(yB + 1, xB + 1) img(yC + 1, xC + 1)
        ] * [
            1 - xABCD;
            xABCD
        ];
    end
end

figure(2);
imshow(imgNew);









