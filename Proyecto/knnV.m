function [c]=knnV(Vi,ind,xl,k)

for i=1:k	
	[W,idx] =ismember(Vi,ind);
	idx= idx(1:k,:);
	c = [c mode(xl'(idx),1)];
end
end
