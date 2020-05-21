function [etr, edv]=bernoulli(Xtr, xltr, Xdv, xldv, epsilons)

    %Binarizacion de parametros
    Xdv = binarize(Xdv);
    Xtr = binarize(Xtr);

    %Probabilidades a Priori
    clas_prob = [];

    %Total de clasificaciones
    N = length(xltr);

    %Parametros Bernoulli
    ber_par = [];

    for i = unique(xltr)'
        %indices de elementos con clase i
        ind_i = find(xltr==i);

        %Total de elementos con clase i
        cn = length(ind_i);

        %Calcular porbabilidad de clase i
        prob_c = cn / N;
        clas_prob = cat(1, clas_prob, prob_c);

        %Imagenes con clase i
        Xtri = Xtr(ind_i, :);

        %Parametro de Bernoulli clase i
        Xtri = Xtr(ind_i, :);
        added_vector = sum(Xtri);
        
        ber_par_i = added_vector / cn;
        ber_par = cat(1, ber_par, ber_par_i);    
    end

    for e = epsilons
        % Smoothing usando Truncamiento simple
        menor_e = ber_par < e;
        mayor_e = ber_par > 1-e;
        intermedio = ber_par >= e & ber_par <= 1-e;

        smoot_ber_par = (menor_e * e) + intermedio .* ber_par + (mayor_e * (1-e));

        cls = [];

        wc = log(smoot_ber_par) - log(1 - smoot_ber_par);
        w0 = log(clas_prob) + sum(log(1 - smoot_ber_par), 2);

        [val_max, i_max] = max(Xdv * wc' + w0', [], 2);
        cls = i_max - 1;
        edv = mean(xldv!=cls)*100;

        [val_max, i_max] = max( Xtr * wc' + w0', [], 2);
        cls = i_max - 1;
        etr = mean(xltr!=cls)*100;
    end

endfunction