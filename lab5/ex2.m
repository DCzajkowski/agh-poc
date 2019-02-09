clc;
clearvars;
close all;

images = ["rice.png", "katalog.bmp"];

for i = 1:2
    img = imread(char(images(i)));

    [X, Y] = size(img);

    imgBW = img;

    for i = 1:X
        for j = 1:Y
            if imgBW(i, j) > meanLT(i, j, 7, img, X, Y)
                imgBW(i, j) = 255;
            else
                imgBW(i, j) = 0;
            end
        end
    end

    imgB2 = img;

    for i = 1:X
        for j = 1:Y
            m = meanLT(i, j, 15, img, X, Y);
            odch = stddevLT(i, j, 15, img, m, X, Y);
            T = m * (1 + 0.05 * (odch / 128 - 1));
            if imgB2(i,j) > T
                imgB2(i,j) = 255;
            else
                imgB2(i,j) = 0;
            end
        end
    end

    figure;

    subplot(1, 3, 1); 
    imshow(img); 
    title('original');

    subplot(1, 3, 2); 
    imshow(imgBW); 
    title('meanLT');

    subplot(1, 3, 3); 
    imshow(imgB2); 
    title('stddevLT');
end

