function [c]=knnV(Vi,ind,xl,k)

c = [];

for i=1:k	
	[W,idx] = ismember(Vi,ind);
	idx = idx(1:k,:);
    idx = nonzeros(idx');
	c = [c mode(xl'(idx),1)];
end
end
