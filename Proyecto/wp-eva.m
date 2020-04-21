#!/usr/bin/octave -qf

if (nargin!=5)
printf("Usage: pca+knn-eva.m <trdata> <trlabels> <tedata> <telabels> <k>\n")
exit(1);
end;

arg_list=argv();
trdata=arg_list{1};
trlabs=arg_list{2};
tedata=arg_list{3};
telabs=arg_list{4};
k=str2num(arg_list{5});

load(trdata);
load(trlabs);
load(tedata);
load(telabs);

ind=wilson(X,xl,1);
err=knn(X(ind,:),xl(ind),Y,Yl,1);
printf("error sin PCA:  %d \n", err);
save_precision(4); save("wp-evaNOpca.out", "err");

[m W] = pca(X);
A = [];
for i = k
    Xr = (X - m) * W(:, 1:i);
	ind = wilson(Xr,xl,1);
    Yr = (Y - m) * W(:, 1:i);
	[err] = knn(Xr(ind,:), xl(ind), Yr, yl, 1);
	aux = [i, err];
    A = cat( 1 , A, aux);
	printf("%d\t%.3f\n", i, err);
end

save_precision(4); save("wp-eva.out", "A");

	
