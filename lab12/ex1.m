close all;
clearvars;
clc;

imgs = ["dwieFale.bmp", "kolo.bmp", "kwadrat.bmp", "kwadrat45.bmp", "trojkat.bmp"];

for i = 1:length(imgs)
    img = imread(char(imgs(i)));

    img_transformed = fft2(img);
    img_transformed_shifted = fftshift(img_transformed);

    figure(i);
    subplot(1, 4, 1);
    imshow(img);
    title('Obraz Oryginalny');

    subplot(1, 4, 2);
    A = log10(abs(img_transformed_shifted) + 1); % amplituda
    imshow(A, []);
    title('Amplituda');

    subplot(1, 4, 3);
    F = angle(img_transformed_shifted .* (A > 0.0001)); % faza
    imshow(F, []);
    title('Faza');

    subplot(1, 4, 4);
    F1 = fft(A, [], 1);
    F2 = fft(F1, [], 2);
    imshow(abs(F2 - img_transformed), []);
    title('Różnica między ręcznym wykonaniem fft a fft2');
end

