close all;
clearvars;
clc;

img = imread('kwadraty.png');

e = edge(img, 'canny');

figure(1);

subplot(2, 1, 1);
imshow(e);

subplot(2, 1, 2);
imshow(img);

[H, theta, rho] = hough(e);

%%
close all;

figure(2);
% subplot(3, 1, 3);
% imshow(H, []);


hp = houghpeaks(H, 8);
% hold on;
% plot(hp, 'ro');
imshow(H,[],'XData',theta,'YData',rho,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(theta(hp(:,2)),rho(hp(:,1)),'o','color','red');
hold off;

%%

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
end



