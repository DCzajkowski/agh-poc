%% section1
clearvars;
close all;
clc;

img = imread('umbrella.png');
HSV = double(rgb2hsv(img));

H = HSV(:, :, 1);

[Y, X] = size(H);

global minsize; 
minsize = 3;

global prog; 
prog = 0.001;

global segRes; 
segRes = zeros(Y, X);

global index; 
index = 1;

global Mres; 
Mres = zeros(Y, X);

split(H, 1, Y, 1, X);
imshow(segRes, []);

%%

i = 0;

while i < index
	IB = (segRes == i);
	
	if (sum(IB(:)) == 0)
		i = i + 1;

		continue;
	end

	[yF, xF] = find(IB, 1, 'first');

	IBunique = unique(nonzeros(imabsdiff(imdilate(IB, strel('square', 3)), IB) .* segRes));
	joined = 0;

	for k = 1:numel(IBunique)
		IBS = (segRes == IBunique(k));

		[yFS, xFS] = find(IBS, 1, 'first');
		
		color_difference = abs(Mres(yF, xF) - Mres(yFS, xFS));

		if color_difference < (5 / 255)
			segRes(IBS) = i;
			joined = 1;
		end
	end

	if joined == 0
		i = i + 1;
	end
end

segRes_for = segRes;
MRes_for = Mres;

segResu = unique(segRes);

for i = 1:numel(segResu)
	obszar = (segRes == segResu(i));

	if sum(obszar) < 23
		segRes(obszar) = 0;
	end
end

segResu2 = unique(segRes);
segRes3 = segRes;
for i = 1:numel(segResu2)
	obszar = segRes3 == segResu2(i);
	segRes(obszar) = i;
end

img2 = label2rgb(segRes);

subplot(2, 1, 1);
imshow(img);

subplot(2, 1, 2);
imshow(img2, []);

