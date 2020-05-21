function M = binarize(X)
    % xrows = rows(X);
    % xcols = rows(X');
    % ones = ones(xrows, xcols);
    % half = ones * 128;
    % M = X >= half;
    threshold = 0.5;
    maxX = max(max(X));
    minX = min(min(X));
    M = (X > (minX+(maxX-minX)*threshold));
endfunction