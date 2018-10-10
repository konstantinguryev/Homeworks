function [L, J] = likelihood2(y,X,b)
s = size(X);
k1 = y-exp(X*b);
k2 = kron(k1,ones(1,s(2)));
z1 = k2.*X;
L1 = -exp(X*b)+y.*X*b;
L = norm(sum(L1));
J = sum(z1,1)'/(2*L);
end