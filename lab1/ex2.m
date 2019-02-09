i = imread('lena_gray.bmp');
[X, map] = gray2ind(i, 256);
figure(1);
imshow(X, map);
 
map = colormap(parula(256));
figure(2);
imshow(X, map);
