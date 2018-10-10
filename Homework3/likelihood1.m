function [L, J] = likelihood1(y,x,b)
s = size(x);
k1 = y-exp(x*b);
k2 = kron(k1,ones(1,s(2)));
z1 = k2.*x;
J = sum(z1,1)'/s(1);
L1 = -exp(x*b)+y.*x*b;
L = sum(L1)/s(1);
end