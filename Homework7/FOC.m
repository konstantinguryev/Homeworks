function f = FOC(V,p,p_1,L,c,beta,v,tr_pr)
c1 = repmat(c',L,1);
[d0, d1, d2] = Ds(p,p_1,v);
[w0, w1,w2] = Ws(V,tr_pr);
FOC=1-(1-d1).*(p-c1)-beta*w1+beta*(d0.*w0+d1.*w1+d2.*w2);
f = FOC;
end