function split(img, yS, yE, xS, xE)
    global minsize;
    global segRes;
    global Mres;
    global prog;
    global index;
    
    W = img(yS:yE, xS:xE);
    M = mean(W(:));
    st = std(W(:));
    size1 = yE - yS;
    size2 = xE - xS;

    if (st > prog) && (size1 > minsize) && (size2 > minsize)
        y = floor((yS + yE) / 2);
        x = floor((xS + xE) / 2);

        split(img, yS, y, xS, x);
        split(img, y + 1, yE, xS, x);
        split(img, yS, y, x + 1, xE);
        split(img, y + 1, yE, x + 1, xE);
    else
        segRes(yS:yE, xS:xE) = index;
        Mres(yS:yE, xS:xE) = M;
        index = index + 1;
    end
end
