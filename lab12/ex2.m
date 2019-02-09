close all;
clearvars;
clc;

img = imread('kwadrat.bmp');
img2 = imread('kwadratT.bmp');
img3 = imread('kwadratS.bmp');
img4 = imread('kwadrat45.bmp');
img5 = imread('kwadratKL.bmp');

move = 20;
tform = affine2d([
    1 0 0;
    0 1 0;
    move move 1
]);

img_ = imref2d(size(img));
img_.XWorldLimits(2) = img_.XWorldLimits(2) + move;
img_.YWorldLimits(2) = img_.YWorldLimits(2) + move;
[img_transformed, ~] = imwarp(img, tform, 'OutputView', img_);

img_ = imref2d(size(img2));
img_.XWorldLimits(2) = img_.XWorldLimits(2) + move;
img_.YWorldLimits(2) = img_.YWorldLimits(2) + move;
[img2_transformed, ~] = imwarp(img2, tform, 'OutputView', img_);

transform(img, img_transformed, false);
transform(img2, img2_transformed, false);

transform(img, imrotate(img, 90), false);
transform(img4, imrotate(img4, 90), false);

transform(img, imresize(img, 0.6), false);
transform(img3, imresize(img3, 0.6), false);

transform(img, img4, imlincomb(0.5, img, 0.5, img4));
transform(img, img5, imlincomb(0.5, img, 0.5, img5));
transform(img5, img4, imlincomb(0.5, img5, 0.5, img4));
