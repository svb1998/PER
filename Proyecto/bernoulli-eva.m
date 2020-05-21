#!/usr/bin/octave -qf

if (nargin!=5)
printf("Usage: bernoulli-exp.m <trdata> <trlabels> <tedata> <telabels> <epsilons>\n")
exit(1);
end;

arg_list=argv();
trdata=arg_list{1};
trlabs=arg_list{2};
tedata=arg_list{3};
telabs=arg_list{4};
epsilons=str2num(arg_list{5});

load(trdata);
load(trlabs);
load(tedata);
load(telabs);



plot_mat = [];

for e=epsilons

    [etr, edv] = bernoulli(X, xl, Y, yl, e);
    plot_mat = [plot_mat; e, edv];

endfor

save_precision(4); save("erorr_eva_bernoulli.out", "plot_mat");
