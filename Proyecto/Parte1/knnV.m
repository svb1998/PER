function [c]=knnV(Vi,ind,xl,k)

c = []; 

idx =Vi(ismember(Vi,ind));
if(length(idx) > 0)
	idx= idx(1:k,:);
	c = mode(xl'(idx),1);
end
end
