function llh = LLH_1(N,b0,s_b,g,LH_i,method)

% Method corresponds to MC and GQ
rng(2);
global x20 w20
x=x20;
w=w20;

if method==2 % MC method
    U=normrnd(b0,sqrt(s_b),100,100); 
    int=zeros(1,N);
    for k=1:100
        int=int+(1/100)*LH_i(U(k,:),g,0);
    end
    llh=sum(log(int));
else % GQ method
    int=zeros(1,N);
    for k=1:20
        int=int+w(k)*LH_i(b0+sqrt(2*s_b)*x(k),g,0)/sqrt(pi);
    end
    llh=sum(log(int));
end