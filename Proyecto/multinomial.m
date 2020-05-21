function [etr, edv]=multinomial(Xtr, xltr, Xdv, xldv, epsilons)

    %1e-10 1e-9 1e-8 1e-7 1e-6 1e-5 1e-4 1e-3 1e-2 1e-1   

    plot_mat = [];     
    
    for e=epsilons  

        %Matriz con la probabilidad a priori por clase
        clas_prob = [];

        %Matriz con prototipo polinomial de cada clase
        prot_pol = [];

        %Total de clases
        N = length(xltr);  

        %Clases selecinadas por el clasificador
        cls = [];

        for i = unique(xltr)'

            %indices de elementos con clase i
            ind_i = find(xltr==i);

            %Total de elementos con clase i
            cn = length(ind_i);

            %Calcular porbabilidad de clase i
            prob_c = cn / N;
            clas_prob = cat(1, clas_prob, prob_c);
        
            %Obtener imagenes con clase i
            Xtri = Xtr(ind_i, :);

            %Prototipo Polinomial clase i
            added_vector = sum(Xtri);
            total_vector = sum(added_vector);
            prot_pol_i = added_vector/total_vector; 

            %normalizar prototipo
            norm_prot = (prot_pol_i + e) / sum(prot_pol_i + e);

            prot_pol = cat(1, prot_pol, norm_prot);
        endfor


        [val_max, i_max] = max(Xdv * log(prot_pol') + log(clas_prob'), [], 2);
        cls = i_max - 1;
        edv = mean(xldv!=cls)*100;

        [val_max, i_max] = max(Xtr * log(prot_pol') + log(clas_prob'), [], 2);
        cls = i_max - 1;
        etr = mean(xltr!=cls)*100;

        plot_mat = [plot_mat; e, edv];
               
    endfor

    save_precision(4); save("erorr_multinomial.out", "plot_mat");

endfunction
