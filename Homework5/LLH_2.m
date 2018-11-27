function llh = LLH_2(N,b0,u0,s_b,s_bu,s_u,g,LH_i)

% Here we use Monte Carlo method with 100 nodes

rng(2);
Mu=[b0;u0];

for t=1:100
    if s_b>=0 && s_u>=0 && s_b*s_u-s_bu^2>=0
        Sigma=[s_b,s_bu;s_bu,s_u];
        break
    else
        s_bu=sqrt(0.5*abs(s_b*s_u));
        s_b=s_b*(s_b>=0)+1*(s_b<0);
        s_u=s_u*(s_u>=0)+1*(s_u<0);
        Sigma=[1,s_bu;s_bu,1];
    end
end


X=(mvnrnd(Mu,Sigma,100*100))';
int3=zeros(1,N);
for k=1:100
    int3=int3+(1/100)*...
        LH_i(X(1,(k-1)*100+1:k*100),g,X(2,(k-1)*100+1:k*100));
end
llh=sum(log(int3));