function [m,W]=pca(X)
  m = mean(X);
  Xm = X - m;
  Xcov = Xm' * Xm;
  [eigvec, eigval] = eig(Xcov);
  [eigval I] = sort(diag(eigval),"descend");
  W = eigvec(:,I);
end