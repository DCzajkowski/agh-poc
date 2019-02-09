function data_filtered = bilateral_local(data, local_window)
    Nx = size(data,2);
    data_filtered = zeros(Nx,1);
    wsp = 9;
    Ncy = ceil(local_window(1)/2);
    Ncx = ceil(local_window(2)/2);
    
    for i=1:Nx
        patch = reshape(data(:,i), local_window);

        [rows, cols] = find(patch == patch);
        rows = reshape(rows, local_window);
        cols = reshape(cols, local_window);

        d = sqrt((Ncy - rows).^2 + (Ncx - cols).^2);
        y = abs(patch - patch(Ncy,Ncx));
        h = exp(((-1) * (y .* y)) / (2 * wsp^2));
        p = exp(((-1) * (d .* d)) / (2 * wsp^2));
        
        data_filtered(i) = sum(sum(p .* patch .* h))/sum(sum(p .* h));
    end
end
