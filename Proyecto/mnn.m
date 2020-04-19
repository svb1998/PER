%FUNCION MNN
function [V] = mnn(X,xl,m)

for i=1:m
	D = L2dist(X,i);
	[D,idx]= sort(D,'ascend');
	idx= idx(1:m,:);
	V = [V mode(xl'(idx),1)];
end
end
