function [x,w]=newton_coates(n,a,b)
w=zeros(n,1); x=zeros(n,1);
for i=1:n
    if or(i==1,i==n)
        w(i)=1/(3*n);
    elseif mod(i,2)==0
            w(i)=4/(3*n);
    elseif mod(i,2)~=0
        w(i)=2/(3*n);
    end
end
for j=1:n
    if j==1
        x(j)=a;
    else
        x(j)=x(j-1)+((b-a)/n);
    end
end
end