function p1=br(v)
p=[2;2];
tol=1e-10;
maxit=10000;
[fval, iJac_0]=cournot_hw2(p,v);
iJac=inv(iJac_0);
for i=1:maxit
    if norm(fval) < tol
    fprintf('i: %d P_A = %f, P_B = %f, norm(f(x)) = %.6f\n', i, p(1), p(2), norm(fval));
    break
    end
   d = -(iJac*fval);
   p = p + d;
   f_prev = fval;
   fval=cournot_hw2(p,v);
   u=iJac*(fval-f_prev);
   iJac=iJac+((d-u)*(d'*iJac))/(d'*u);
end
p1=p;
end