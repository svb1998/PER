function M = binarize(X)
    xrows = rows(X);
    xcols = rows(X');
    ones = ones(xrows, xcols);
    half = ones * 128;
    M = X >= half;
endfunction