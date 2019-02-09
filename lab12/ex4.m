close all;
clearvars;
clc;

img = imread('lena.bmp');

for i = 1:3
    img_transformed = fft2(img);

    img_transformed_shifted = fftshift(img_transformed);

    A = log10(abs(img_transformed_shifted) + 1);
    F = angle(img_transformed_shifted .* (A > 0.0001));

    % Filtracja

    [f1, f2] = freqspace(512, 'meshgrid');

    Hd = ones(512);
    r = sqrt(f1 .^ 2 + f2 .^ 2);

    if i == 1 % Filtr dolnoprzepustowy
        Hd((r > 0.1)) = 0;
    elseif i == 2 % Filtr górnoprzepustowy
        Hd((r < 0.3)) = 0;
    else % Filtr dolnoprzepustowy i górnoprzepustowy
        Hd((r < 0.1)) = 0;
        Hd((r > 0.3)) = 0;
    end

    img_transformed_shifted_filtered = img_transformed_shifted .* Hd;

    % Koniec filtracji

    img_transformed_inversed_shift_filtered = ifftshift(img_transformed_shifted_filtered);
    img_inversed_transform_filtered = ifft2(img_transformed_inversed_shift_filtered);

    % Okno Hamminga, Hanninga, Chebysheva

    h = fwind1(Hd, chebwin(21));
    [H, f1, f2] = freqz2(h, 512, 512);

    img_transformed_shifted_corrected = img_transformed_shifted .* H;

    % Koniec okna

    img_transformed_inversed_shift_corrected = ifftshift(img_transformed_shifted_corrected);
    img_inversed_transform_corrected = ifft2(img_transformed_inversed_shift_corrected);

    figure;

    subplot(2, 3, 1);
    imshow(img);
    title('Obraz oryginalny');

    subplot(2, 3, 2);
    imshow(A, []);
    title('Amplituda');

    subplot(2, 3, 3);
    imshow(F, []);
    title('Faza');

    subplot(2, 3, 4);
    imshow(img_inversed_transform_filtered, []);
    title('Obraz po transformacjach filtra');

    subplot(2, 3, 5);
    imshow(img_inversed_transform_corrected, []);
    title('Obraz po transformacjach okna');

    subplot(2, 3, 6);
    mesh(f1, f2, Hd);
    title('Wizualizacja okna');
end
