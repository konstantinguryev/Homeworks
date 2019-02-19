global  l L c v delta rho beta kappa stop lambda;
 
l = 15;
L = 30;
c = zeros(L,1); 
v = 10;
delta = 0.03;
rho = 0.85;
beta = 1/1.05;
kappa = 10;

stop = 1e-3; 
lambda = 1; 

%I also tried lambda = 0.5 as proposed in dampening procedure. The number of iterations to converge was twice
%larger

c(1:l)=kappa*[1:1:l]'.^(log(rho)/log(2)); %Constructing cost function 
c(l+1:end) = kappa*(l^(log(rho)/log(2)));
tr_pr=zeros(L+1,L); %Constructing the state transition conditional on sales
for i=1:L+1
    if i==1
       tr_pr(i,1)=1;
    elseif i==L+1
            tr_pr(i,L)=1;
    else
        tr_pr(i,i-1)=1-(1-delta)^(i);
        tr_pr(i,i)=(1-delta)^(i);
    end
end