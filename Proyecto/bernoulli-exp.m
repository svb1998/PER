#!/snap/bin/octave -qf

if (nargin!=5)
printf("Usage: bernoulli-exp.m <trdata> <trlabels> <epsilons> <%%trper> <%%dvper>\n")
exit(1);
end;

arg_list=argv();
trdata=arg_list{1};
trlabs=arg_list{2};
epsilons=str2num(arg_list{3});
trper=str2num(arg_list{4});
dvper=str2num(arg_list{5});

load(trdata);
load(trlabs);

N=rows(X);


Ntr=round(trper/100*N);
Ndv=round(dvper/100*N);
Xtr=X(1:Ntr,:); xltr=xl(1:Ntr);
Xdv=X(N-Ndv+1:N,:); xldv=xl(N-Ndv+1:N);


plot_mat = [];

for e=epsilons

    [etr, edv] = bernoulli(Xtr, xltr, Xdv, xldv, e);
    plot_mat = [plot_mat; e, edv];

endfor

save_precision(4); save("erorr_bernoulli.out", "plot_mat");

