clearvars;
close all;
clc;

img = imread('kw.bmp');

load maskiPP;

R1 = [
	0, 0, 0;
	-1, 0, 0;
	0, 1, 0
];

R2 = [
	0, 0, 0;
	0, 0, -1;
	0, 1, 0
];

P1 = [
    -1 0 1;
    -1 0 1;
    -1 0 1;
];

P2 = [
    -1 -1 -1;
    0 0 0;
    1 1 1;
];

S1 = [
    -1 0 1;
    -2 0 2;
    -1 0 1;
];

S2 = [
    -1 -2 -1;
    0 0 0;
    1 2 1;
];

mask = fspecial('laplacian');
imgR1 = uint8(conv2(img, R1, 'same'));
imgR2 = uint8(conv2(img, R2, 'same'));
imgP1 = uint8(conv2(img, P1, 'same'));
imgP2 = uint8(conv2(img, P2, 'same'));
imgS1 = uint8(conv2(img, S1, 'same'));
imgS2 = uint8(conv2(img, S2, 'same'));

figure(2);

subplot(4, 3, 1);
imshow(img, []);
title('oryginał');

subplot(4, 3, 2);
imshow(imgR1, []);
title('R1');

subplot(4, 3, 3);
imshow(imgR2, []);
title('R2');

subplot(4, 3, 4);
imshow(imgP1, []);
title('P1');

subplot(4, 3, 5);
imshow(imgP2, []);
title('P2');

subplot(4, 3, 6);
imshow(imgS1, []);
title('S1');

subplot(4, 3, 7);
imshow(imgS2, []);
title('S2');

%%

img = imread('jet.bmp');
S3 = conv2(img, S1, 'same');
S4 = conv2(img, S2, 'same');

imgOut = sqrt(S3.^2+S4.^2);
imgOut2 = abs(S3) + abs(S4);

subplot(3, 1, 1);
imshow(img);

subplot(3, 1, 2);
imshow(imgOut, []);

subplot(3, 1, 3);
imshow(imgOut2, []);
