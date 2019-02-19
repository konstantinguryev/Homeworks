tic;
Parameters;
V_0 = (repmat(v,L,L) + repmat(c',L,1))./(2*beta);
P_0 = 1.5*repmat(c',L,1);

[value, p, it] = VFI(V_0, P_0, stop, L, c, lambda, beta, v, tr_pr);
% it did not converge to the equilibrium, see answer key
figure(1);
mesh(value); 
title('Value Func');
xlabel('Firm1 Knowledge');
ylabel('Firm2 Knowledge');
zlabel('Value Func');
figure(2);
mesh(p); 
title('Price');
xlabel('Firm1 Knowledge');
ylabel('Firm2 Knowledge');
zlabel('Value Func');
fprintf('Time:%f sec',toc);

