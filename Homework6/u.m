function u = u(p,x)
x1 = x.*(x>=0);
out = p.*x1-0.2*x1.^(1.5);
u=out-100*(x<0);
end