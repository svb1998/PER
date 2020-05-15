function ld = logdet(S)
    eigval = eig(S);
    if(any(eigval <= 0)) 
        ld = log(realmin);
    else 
        ld = sum(log(eigval));
    end
endfunction 