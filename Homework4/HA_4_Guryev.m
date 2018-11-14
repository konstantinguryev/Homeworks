
%% Problem 1
[x1,w1] = qnwequi(100000,[0,0],[1,1],'N'); 
p1=x1(:,1).^2+x1(:,2).^2 <= 1; 
pimc1 = 4*w1'*p1; %quasi-Monte Carlo

%% Problem 2
f1=@(x,y)(double(x.^2+y.^2<=1));
[x2,wx2] = newton_coates(10000,0,1); 
% I think there is a function in compecon that does it for you



f_val2 = zeros(10000,10000);

% aviod loops in matlab, they are slower. use matrix operations. check
% answer key
for i = 1:length(x2)
    f_val2(i,:) = f1(repmat(x2(i),1,length(x2)),x2');
end
pinc1 = 4*wx2'*f_val2*wx2; %Newton-Coates

%% Problem 3
[x3,w3] = qnwequi(100000,0,1,'N'); 
pimc2 = 4*w3'*(1-x3.^2).^0.5; %quasi-Monte Carlo

%% Problem 4
[x4,wx4] = newton_coates(10000,0,1); 
f_val4 = (1-x4.^2).^0.5;
pinc2 = 4*wx4'*f_val4;%Newton-Coates

%% Problem 5
simul = zeros(4,2);
f1=@(x,y)(double(x.^2+y.^2<=1));
draws=[100,1000,10000];
for k=1:length(draws)
    [a,b]=newton_coates(draws(k),0,1);
    f_val1=zeros(length(a),length(a));
    for i=1:length(a)
    f_val1(i,:)=f1(repmat(a(i),1,length(a)),a');
    end
    simul(3,k)=4*b'*f_val1*b;
end
clear a b f_val1 k
for l=1:length(draws)
    [c,d]=newton_coates(draws(l),0,1); 
    f_val3=(1-c.^2).^0.5;
    simul(4,l)=4*d'*f_val3;
end
clear c d f_val3 l
for m=1:length(draws)
    [e,f]=qnwequi(draws(m),[0,0],[1,1],'N'); 
    p1=e(:,1).^2+e(:,2).^2<=1; 
    simul(1,m)=4*f'*p1;

end
clear e f test1 m

for n=1:length(draws)
    [g,h]=qnwequi(draws(n),0,1,'N'); 
    simul(2,n)=4*h'*(1-g.^2).^0.5; 
end
clear g h n
results = abs(simul-pi);
