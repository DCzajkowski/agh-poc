function transform(img1, img2, img3)
    figure;

    for i = 1:3
        switch(i)
            case 1
                img = img1;
            case 2
                img = img2;
            case 3
                img = img3;
        end

        if img == false
            continue;
        end

        img_transformed = fft2(img);
        img_transformed_shifted = fftshift(img_transformed);

        A = log10(abs(img_transformed_shifted) + 1);
        F = angle(img_transformed_shifted .* (A > 0.0001));

        subplot(3, 3, 1 + ((i - 1) * 3));
        imshow(img);
        title('Obraz oryginalny');

        subplot(3, 3, 2 + ((i - 1) * 3));
        imshow(A, []);
        title('Amplituda');

        subplot(3, 3, 3 + ((i - 1) * 3));
        imshow(F, []);
        title('Faza');
    end
end
