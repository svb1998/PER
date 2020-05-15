function [etr, edv] = gaussian(Xtr, xltr, Xdv, xldv, alphas)

    plot_mat = [];

    %Probabilidad a priori clases
    pc = [];
    
    %Media de las clases
    mu = [];

    %Matriz de covarianza
    sigma = {};

    %Total de elementos
    N = length(xltr);



    for i = unique(xltr)'
        ind_c = find(xltr == i);
        cn = length(ind_c);
        Xtri = Xtr(ind_c, :);

        %probabilidad a priori de clase i
        prob_c = cn / N;
        pc = cat(1, pc, prob_c);

        %Media de clase i
        mean_c = mean(Xtri);
        mu = cat(1, mu, mean_c);

        %Covarianza clase i 
        sigma{i + 1} = cov(Xtri, 1); 
    endfor
    
    for a = alphas
        G = [];

        for i = unique(xltr)'
            i_mat = eye(rows(sigma{i+1}));
            norm_sigma =  a * sigma{i+1} + (1 - a) * i_mat;
            gc_vect = gc( pc(i+1, :), mu(i+1, :)', norm_sigma, Xtr);
            G = [G , gc_vect];
        endfor

        [val_max, i_max] = max(G, [], 2);
        cls = i_max - 1;
        etr = mean(xltr!=cls)*100;

        plot_mat = [plot_mat; a, etr];
    
    endfor
    
    save_precision(4); save("erorr_gauss.out", "plot_mat");


endfunction