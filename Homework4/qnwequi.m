%function [x,w] = qnwequi(n,a,b,type)
function [x,w] = qnwequi(n,a,b,type)
global equidist_pp

if isempty(equidist_pp)
  equidist_pp=sqrt(primes(7920));   % good for d<=1000 
end

d  = max(length(n),max(length(a),length(b)));
n=prod(n);
if nargin<4, type='N'; end

i=(1:n)';
switch upper(type(1))
  case 'N'                 % Neiderreiter 
    j=2.^((1:d)/(d+1));
    x=i*j;
    x=x-fix(x);
  case 'W'                 % Weyl
    j=equidist_pp(1:d);
    x=i*j;
    x=x-fix(x);
  case 'H'                 % Haber
    j=equidist_pp(1:d);
    x=(i.*(i+1)./2)*j;
    x=x-fix(x);
  case 'R'                 % pseudo-random
    x=rand(n,d);
  otherwise
    error('Unknown sequence requested')
end
u=ones(n,1);
r = b-a;
x = a(u,:) + x.*r(u,:);
w = (prod(r)/n)*u;