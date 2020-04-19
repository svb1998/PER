function ind =wilson(X,xl,k)
N=rows(X);
ind= [1:rows(X)];

%Función mnn
[V]=mnn(X,xl,100);

error = true;
while(error)
	error = false;
	for i = 1:N
		Vi = V(:,i);
		c = knnV(Vi,ind,xl,1);
		if(c!=xl(i, :))
			ind = setdiff(ind,[i]);
			error = true;
	end
end

end
