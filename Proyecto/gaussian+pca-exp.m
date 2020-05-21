#!/usr/bin/octave -qf

if (nargin!=6)
printf("Usage: gaussian+pca-exp.m <trdata> <trlabels> <alphas> <%%trper> <%%dvper> <ks>\n")
exit(1);
end;

arg_list=argv();
trdata=arg_list{1};
trlabs=arg_list{2};
alphas=str2num(arg_list{3});
trper=str2num(arg_list{4});
dvper=str2num(arg_list{5});
ks=str2num(arg_list{6});


load(trdata);
load(trlabs);

N=rows(X);

rand("seed",23); permutation=randperm(N);
X=X(permutation,:); xl=xl(permutation,:);

Ntr=round(trper/100*N);
Ndv=round(dvper/100*N);
Xtr=X(1:Ntr,:); xltr=xl(1:Ntr);
Xdv=X(N-Ndv+1:N,:); xldv=xl(N-Ndv+1:N);

[m W] = pca(Xtr);

err_mat = [];

for a = alphas
    err_mat_a =[];
    for i = ks 
        XtrP = (Xtr - m) * W(:, 1:i);
        XdvP = (Xdv - m) * W(:, 1:i);
        [etr, edv] = gaussian(XtrP, xltr, XdvP, xldv, a);

        err_mat_a = [err_mat_a; a, i, edv];
    end

    err_mat = [err_mat, err_mat_a];
end


save_precision(4); save("error_gauss+pca.out", "err_mat");
