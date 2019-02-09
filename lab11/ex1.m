close all;
clearvars;
clc;

img = imread('ccl1.png');

figure(1);
imshow(img);

[sizeY, sizeX] = size(img);

L = 1;

N = 100;

id = zeros(N);
id = id(:, 1);

for i = 1:N
    id(i)= i;
end

for y = 2:sizeY
    for x = 2:sizeX - 1
        if (img(y, x) <= 0)
            continue;
        end

        sasiedzi = [img(y - 1, x - 1), img(y - 1, x), img(y - 1, x + 1), img(y, x - 1)];
        suma = sum(sasiedzi);

        if (suma == 0) % sytuacja (a)
            img(y, x) = L;
            L = L + 1;
        end

        if (suma > 0)
            sasiedziBezZer = nonzeros(sasiedzi);
            minimum = min(sasiedziBezZer);
            maximum = max(sasiedziBezZer);

            if (minimum == maximum) % sytuacja (b)
                img(y, x) = minimum;
            else % sytuacja (c)
                id(root(minimum, id)) = root(maximum, id);

                img(y, x) = minimum;
            end
        end
    end
end

figure(2);
imshow(label2rgb(img));

lut = id;

for i = 1:length(id)
    lut(i) = root(i, id);
end

for y = 2:sizeY
    for x = 2:sizeX - 1
        if (img(y, x) > 0)
            img(y, x) = lut(img(y, x));
        end
    end
end

figure(3);
imshow(label2rgb(img), []);

function index = root(index, id)
    while (id(index) ~= index)
        index = id(index);
    end
end
