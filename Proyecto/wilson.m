function ind =wilson(X,xl,k)
N=rows(X);
ind= [1:rows(X)];

%Función mnn
[V]=mnn(X,xl,100);
printf("He pasado mnn correctamente.\n");
error = true;
while(error)
	error = false;
	for i = ind
		printf("Iteracion %d\n", i);
		Vi = V(:,i);
		c = knnV(Vi,ind,xl,1);
		printf("Entro a IF\n");
		if(length(c)>0 && c!=xl(i,:))
			printf("Clases distintas, eliminaré el indice\n");
			ind = setdiff(ind,[i]);
			error = true;
		end
		printf("clase: %d\n", c);
	end
	printf("Acabado el for\n");
end
printf("Acabado el while\n")
end
