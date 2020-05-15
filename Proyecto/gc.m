function gc = gc(pc, mu, sigma, X)

    inv_sigma = pinv(sigma);
    ld = logdet(sigma);


    gc = X*(-0.5*inv_sigma)*X' + (inv_sigma*mu)'*X + log(pc) - 0.5 * ld - 0.5 * mu' * inv_sigma * mu;

endfunction