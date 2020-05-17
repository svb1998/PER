#!/usr/bin/octave -qf

if (nargin!=5)
printf("Usage: gaussian+pca-eva.m <trdata> <trlabels> <tedata> <telabels> <alphas>\n")
exit(1);
end;

arg_list=argv();
trdata=arg_list{1};
trlabs=arg_list{2};
tedata=arg_list{3};
telabs=arg_list{4};
alphas=str2num(arg_list{5});


load(trdata);
load(trlabs);
load(tedata);
load(telabs);

plot_mat = [];

for a=alphas

    [etr, edv] = gaussian(X, xl, Y, yl, a);
    plot_mat = [plot_mat; a, edv];

endfor

save_precision(4); save("erorr_gauss_eva.out", "plot_mat");

