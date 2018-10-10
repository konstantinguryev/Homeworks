function [a, b, c] = mle_qn_est(init,y,X)
b_mle_init = init;
opt2 = optimset('Display','Final');
l_z = @(b)likelihood2(y,X,b);
tic
[b_mle_qn,fval,exit] = fminunc(l_z,b_mle_init,opt2);
a = toc;
b = exit;
c = 2;
end
