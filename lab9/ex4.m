close all;
clearvars;
clc;

img = imread('lab112.png');

subplot(2, 1, 1);
imshow(img);

% e = im2bw(img, 37 / 255);
% % e = imbinarize(img, 0.4);
% e = imcomplement(e);
% e = imclearborder(e);
% % e = imreconstruct(imerode(e, ones(1, 100)), e);
% % 
% % e = imerode(e, [
% %     0 1 0;
% % %     0 1 0;
% % %     0 1 0
% % % ]);
% % 
% % % e = bwmorph(e, 'thin', 1);
% e = edge(e, 'canny');


e = img;
e = im2bw(e, 37/255);
e = imcomplement(e);
e = imclearborder(e);
SE = strel('square',3);
e = imopen(e, SE);
e = imclose(e, SE);
e = edge(e, 'canny');

subplot(2, 1, 2);
imshow(e);


%%

[H, theta, rho] = hough(e);

hp = houghpeaks(H, 8);

figure(3);
lines = houghlines(e, theta, rho, hp, 'FillGap', 5, 'MinLength', 7);
imshow(img);
hold on;
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
   
   plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');
end

hold off;




