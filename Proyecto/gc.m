function gc = gc(pc, mu, sigma, X)

    inv_sigma = pinv(sigma);
    ld = logdet(sigma);

    fst_op = X*(-0.5*inv_sigma);
    scnd_op = fst_op .*X;
    cuadratic_elem = sum(scnd_op, 2);

    linear_elem = inv_sigma*mu;
    linear_elem = linear_elem' .* X;
    linear_elem = sum(linear_elem, 2);
    
    constant = log(pc) - 0.5 * ld - 0.5 * mu' * inv_sigma * mu;

    gc = cuadratic_elem + linear_elem + constant;

endfunction