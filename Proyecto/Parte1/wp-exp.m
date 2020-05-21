#!/usr/bin/octave -qf

if (nargin!=5)
printf("Usage: wp-exp.m <trdata> <trlabels> <ks> <%%trper> <%%dvper>\n")
exit(1);
end;

arg_list=argv();
trdata=arg_list{1};
trlabs=arg_list{2};
ks=str2num(arg_list{3});
trper=str2num(arg_list{4});
dvper=str2num(arg_list{5});

load(trdata);
load(trlabs);

N=rows(X);
rand("seed",23); permutation=randperm(N);
X=X(permutation,:); xl=xl(permutation,:);

Ntr=round(trper/100*N);
Ndv=round(dvper/100*N);
Xtr=X(1:Ntr,:); xltr=xl(1:Ntr);
Xdv=X(N-Ndv+1:N,:); xldv=xl(N-Ndv+1:N);

%
% HERE YOUR CODE
% 

ind=wilson(Xtr,xltr,1);
err=knn(Xtr(ind,:),xltr(ind),Xdv,xldv,1);
printf("error sin PCA:  %d \n", err);
save_precision(4); save("wp-expNOpca.out", "err");


[m W] = pca(Xtr);
printf("Hecho PCA \n");
A = [];
for i = ks 
	printf("Iteracion en wp-exp %d \n", i);
    XtrP = (Xtr - m) * W(:, 1:i);
	ind=wilson(XtrP,xltr,1);
	printf("HE PASADO EL SEGUNDO WILSON en la iteracion %d \n",i)
    XdvP = (Xdv - m) * W(:, 1:i);
    [err] = knn(XtrP(ind,:), xltr(ind), XdvP, xldv, 1);
    aux = [i, err];
	printf("err %d\n", err);
    A = cat( 1 , A, aux);
end

save_precision(4); save("wp-exper.out", "A");

