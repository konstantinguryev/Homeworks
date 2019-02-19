function [v,p,it] = VFI(V,P,stop,L,c,lambda,beta,v,tr_pr)

v_old = V;
p_old = P;
initial = P;
opt = optimset('Disp','None');
v_new = zeros(size(V));
p_new = zeros(size(P));
tol = 1;
i = 1;

while and(tol > stop, i < 1000)
    f=@(p)FOC(v_old,p,p_old,L,c,beta,v,tr_pr);
    p_new = fsolve(f,initial,opt);
    [d0, d1, d2] = Ds(p_new,p_old,v);
    [w0, w1, w2] = Ws(v_old,tr_pr);
    
    v_new = d1.*(p_new-repmat(c',L,1))+beta*(d0.*w0+d1.*w1+d2.*w2);
    
    tol = max(max(max(abs((v_new-v_old)./(1+v_new)))),max(max(abs((p_new-p_old)./(1+p_new)))));
    
    v_old=lambda*v_new+(1-lambda)*v_old; p_old=lambda*p_new+(1-lambda)*p_old;
    
    fprintf('Iteration:%d\n',i);
    fprintf('Tolerance:%f\n',tol);
    i=i+1;
end
v = v_old;
p = p_old;
it = i;
end