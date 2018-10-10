function [a, b, c]=nls_est(init,y,X)
b_nls_init = init;
opt3 = optimoptions('lsqnonlin','Display','Final','TolF',1e-16,'TolX',1e-16);
f=@(b)y-exp(X*b);
tic
[b_nls,res1,res2,exit]=lsqnonlin(f,b_nls_init,[],[],opt3);
a = toc;
b = exit;
c = 3;
end