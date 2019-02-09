%%

clc;
clear vars;
close all;

%%

figure(1);

img = imread('calculator.bmp');

subplot(4, 4, 1);
imshow(img);
title('obraz');

subplot(4, 4, 2);
x = imerode(img, ones(1, 71));
x = imreconstruct(x, img);
imshow(x);
title('tlo');

subplot(4, 4, 3);
x = imabsdiff(img, x);
z = x;
imshow(x);
title('roznica miedzy tlem a obrazem');

subplot(4, 4, 4);
imshow(imopen(img, ones(1, 71)));
title('imopen dla porownania');

subplot(4, 4, 5);
imshow(imtophat(img, ones(1, 71)));
title('imtophat dla porownania');

subplot(4, 4, 6);
x = imreconstruct(imerode(x, ones(1, 11)), x);
imshow(x);
title('usuniecie pionowych');

subplot(4, 4, 7);
y = imdilate(x, ones(1, 21));
x = imreconstruct(min(y, z), z);
imshow(x);
title('przywrocenie literek');
