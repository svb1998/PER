#!/usr/bin/octave -qf

if (nargin!=6)
printf("Usage: gaussian+pca-eva.m <trdata> <trlabels> <tedata> <telabels> <alphas> <ks>\n")
exit(1);
end;

arg_list=argv();
trdata=arg_list{1};
trlabs=arg_list{2};
tedata=arg_list{3};
telabs=arg_list{4};
alphas=str2num(arg_list{5});
ks=str2num(arg_list{6});


load(trdata);
load(trlabs);
load(tedata);
load(telabs);


% a = 1e-4 ks = 100

[m W] = pca(X);

err_mat = [];

for a = alphas
    err_mat_a =[];
    for i = ks 
        Xr = (X - m) * W(:, 1:i);
        Yr = (Y - m) * W(:, 1:i);
        [etr, edv] = gaussian(Xr, xl, Yr, yl, a);

        err_mat_a = [err_mat_a; a, i, edv];
    end

    err_mat = [err_mat, err_mat_a];
end

save_precision(4); save("error_gauss+pca-eva.out", "err_mat");


