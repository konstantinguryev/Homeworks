function [fval, Jac]=FOC(p,v)
%Here we have fval = -Di(p)/D'i(p)-pi, i.e. the FOC of the profit function,
% where i=A,B.

fval=[(1+exp(v(1)-p(1))+exp(v(2)-p(2)))/(1+exp(v(2)-p(2)))-p(1);(1+exp(v(1)-p(1))+exp(v(2)-p(2)))/(1+exp(v(1)-p(1)))-p(2)];
Jac=[(-exp(v(1)-p(1)))/(1+exp(v(2)-p(2)))-1 (exp(sum(v)-sum(p)))/(1+exp(v(2)-p(2)))^2;...
      (exp(sum(v)-sum(p)))/(1+exp(v(1)-p(1)))^2 (-exp(v(2)-p(2)))/(1+exp(v(1)-p(1)))-1];
end