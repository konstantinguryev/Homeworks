function [c, ceq] = PSD(x)

% Check on PSD of 2-by-2 x matrix

ceq=[];
V=[x(3),x(4);x(4),x(5)]
c=-det([x(3),x(4);x(4),x(5)]);
end



