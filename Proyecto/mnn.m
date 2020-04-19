%FUNCION MNN
function [V] = mnn(X,xl,m)
N=rows(X);

numbatches=N*N*4/intmax*10;
if (numbatches<1) numbatches=1; end

batchsize=ceil(N/numbatches);




for i=1:m
	Xbatch=X((i-1)*batchsize+1:min(i*batchsize,N),:);
	D = L2dist(X,Xbatch);
	[D,idx]= sort(D,'ascend');
	idx= idx(1:m,:);
	V = [V mode(xl'(idx),1)];
end
end
