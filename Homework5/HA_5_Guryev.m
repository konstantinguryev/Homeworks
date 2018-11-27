clear;
load('hw5.mat')
rng(2);
beta0=0.1;
sig_beta=1;

F=@(eps) (1+exp(-eps)).^(-1);
% Likelihoods in vector form
LH_i=@(b,g,u)...
    prod((F(data.X*diag(b)+data.Z*diag(g)+ones(20,100)*diag(u)).^data.Y).*...
    (1-F(data.X*diag(b)+data.Z*diag(g)+ones(20,100)*diag(u))).^(1-data.Y));

%% Problem 1
global x20 w20
[x20,w20]=GaussHermite_2(20);

int1=zeros(1,data.N);
for k=1:20
    int1=int1+w20(k)*LH_i(beta0+sqrt(2*sig_beta)*x20(k),0,0)/sqrt(pi);
end
% Log-likelihood
LLH1=sum(log(int1));

%% Problem 2

U=normrnd(beta0,sqrt(sig_beta),100,100); 

int2=zeros(1,data.N);
for k=1:100
    int2=int2+(1/100)*LH_i(U(k,:),0,0);
end
% Log-likelihood
LLH2=sum(log(int2));

%% Problem 3

st_val1=[2;1;0];
% GQ
fun1=@(x) -LLH_1(data.N,x(1),x(2),x(3),LH_i,1); 
[estimate1,function1]=fmincon(fun1,st_val1,diag([0,-1,0]),zeros(3,1));

% MC
fun2=@(x) -LLH_1(data.N,x(1),x(2),x(3),LH_i,2);  
[estimate2,function2]=fmincon(fun2,st_val1,diag([0,-1,0]),zeros(3,1));

%% Problem 4
fun3=@(x) -LLH_2(data.N,x(1),x(2),x(3),x(4),x(5),x(6),LH_i);

st_val2=[3;1.5;2;1;2;-0.5];
A=diag([0,0,-1,0,-1,0]);
b=zeros(6,1);
[estimate3,function3]=fmincon(fun3,st_val2,A,b,[],[],[],[],@PSD);


%% Problem 5
display(LLH1,'log-likelihood GQ 20')
display(LLH2,'log-likelihood MC 100')
display(st_val1,'starting value for estimation in 3')
display(estimate1,'GQ 20 estimates of beta0,sigma_beta,gamma')
display(function1,'GQ 20 max val of LLH')
display(estimate2,'MC 100 estimates of beta0,sigma_beta,gamma')
display(function2,'MC 100 max val of LLH')
display(st_val2,'starting value for estimation in 4')
display(estimate3,'MC 100 estimates of beta0,u0,s_b,s_bu,su,gamma')
display(function3,'MC 100 max val of LLH')
