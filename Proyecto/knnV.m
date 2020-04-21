function [c]=knnV(Vi,ind,xl,k)

c = []; 
if(length(idx) > 0)
	idx =Vi(ismember(Vi,ind));
	idx= idx(1:k,:);
	c = mode(xl'(idx),1);
end
end
