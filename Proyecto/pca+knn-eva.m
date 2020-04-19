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

%
% HERE YOUR CODE
%

[m W] = pca(X);
A = [];
for i = k
    Xr = (X - m) * W(:, 1:i);
    Yr = (Y - m) * W(:, 1:i);
	[err] = knn(Xr, xl, Yr, yl, 1);
	aux = [i, err];
    A = cat( 1 , A, aux);
	printf("%d\t%.3f\n", i, err);
end

save_precision(4); save("erroor.out", "A");

	
