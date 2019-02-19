%% Question 1

tic;
Parameters;
V_0 = (repmat(v,L,L) + repmat(c',L,1))./(2*beta);
P_0 = 1.5*repmat(c',L,1);

[value, p, it] = VFI(V_0, P_0, stop, L, c, lambda, beta, v, tr_pr);

figure(1);
mesh(value); 
title('Value Func');
xlabel('Firm1 Knowledge');
ylabel('Firm2 Knowledge');
zlabel('Value Func');
figure(2);
mesh(p); 
title('Price');
xlabel('Firm1 Knowledge');
ylabel('Firm2 Knowledge');
zlabel('Value Func');
fprintf('Time:%f sec',toc);

%% Questions 2&3
 
[D_0,D_1,D_2] = Ds(p,p,v);
T = zeros(L^2,L^2);

for k=1:30
    if k==1
        for i=1:30
            if i==1
                T((k-1)*30+i,(k-1)*30+i)=D_0(k,i)...
                    +D_1(k,i)*(1-(1-delta)^(k+1))+D_2(k,i)*(1-(1-delta)^(i+1));
                T((k-1)*30+i,(k-1)*30+i+1)=D_2(k,i)*(1-delta)^(i+1);
                T((k-1)*30+i,(k)*30+i)=D_1(k,i)*((1-delta)^(k+1));
            elseif i<30
                T((k-1)*30+i,(k-1)*30+i)=D_0(k,i)*((1-delta)^i)...
                    +D_1(k,i)*(1-(1-delta)^(k+1))*((1-delta)^i)+D_2(k,i)*(1-(1-delta)^(i+1));
                T((k-1)*30+i,(k-1)*30+i+1)=D_2(k,i)*(1-delta)^(i+1);
                T((k-1)*30+i,(k)*30+i)=D_1(k,i)*((1-delta)^(k+1))*(1-delta)^i;
                T((k-1)*30+i,(k-1)*30+i-1)=D_0(k,i)*(1-(1-delta)^i)+D_1(k,i)*(1-(1-delta)^(k+1))*(1-(1-delta)^i);
                T((k-1)*30+i,(k)*30+i-1)=D_1(k,i)*((1-delta)^(k+1))*(1-(1-delta)^i);
            elseif i==30
                T((k-1)*30+i,(k-1)*30+i)=D_0(k,i)*((1-delta)^i)...
                    +D_1(k,i)*(1-(1-delta)^(k+1))*((1-delta)^i)+D_2(k,i);
                T((k-1)*30+i,(k-1)*30+i-1)=D_0(k,i)*(1-(1-delta)^i)+D_1(k,i)*(1-(1-delta)^(k+1))*(1-(1-delta)^i);
                T((k-1)*30+i,(k)*30+i)=D_1(k,i)*((1-delta)^(k+1))*(1-delta)^i;
                T((k-1)*30+i,(k)*30+i-1)=D_1(k,i)*((1-delta)^(k+1))*(1-(1-delta)^i);
            end
        end
    elseif k<30
        for i=1:30
            if i==1
                T((k-1)*30+i,(k-1)*30+i)=D_0(k,i)*((1-delta)^k)...
                +D_1(k,i)*(1-(1-delta)^(k+1))+D_2(k,i)*((1-delta)^k)*(1-(1-delta)^(i+1));
                T((k-1)*30+i,(k-1)*30+i+1)=D_2(k,i)*((1-delta)^k)*(1-delta)^(i+1);
                T((k-1)*30+i,(k)*30+i)=D_1(k,i)*((1-delta)^(k+1));
                T((k-1)*30+i,(k-2)*30+i)=D_0(k,i)*(1-(1-delta)^k)+D_2(k,i)*(1-(1-delta)^k)*(1-(1-delta)^(i+1));
                T((k-1)*30+i,(k-2)*30+i+1)=D_2(k,i)*(1-(1-delta)^k)*((1-delta)^(i+1));

            elseif i<30
                T((k-1)*30+i,(k-1)*30+i)=D_0(k,i)*((1-delta)^k)*((1-delta)^i)...
                    +D_1(k,i)*(1-(1-delta)^(k+1))*((1-delta)^i)+D_2(k,i)*((1-delta)^k)*(1-(1-delta)^(i+1));
                T((k-1)*30+i,(k-1)*30+i+1)=D_2(k,i)*((1-delta)^k)*(1-delta)^(i+1);
                T((k-1)*30+i,(k)*30+i)=D_1(k,i)*((1-delta)^(k+1))*(1-delta)^i;
                T((k-1)*30+i,(k)*30+i-1)=D_1(k,i)*((1-delta)^(k+1))*(1-(1-delta)^i);
                T((k-1)*30+i,(k-1)*30+i-1)=D_0(k,i)*((1-delta)^k)*(1-(1-delta)^i)+D_1(k,i)*(1-(1-delta)^(k+1))*(1-(1-delta)^i);
                T((k-1)*30+i,(k-2)*30+i)=D_0(k,i)*(1-(1-delta)^k)*((1-delta)^i)+D_2(k,i)*(1-(1-delta)^k)*(1-(1-delta)^(i+1));
                T((k-1)*30+i,(k-2)*30+i-1)=D_0(k,i)*(1-(1-delta)^k)*(1-(1-delta)^i);
                T((k-1)*30+i,(k-2)*30+i+1)=D_2(k,i)*(1-(1-delta)^k)*((1-delta)^(i+1));

            elseif i==30
                T((k-1)*30+i,(k-1)*30+i)=D_0(k,i)*((1-delta)^k)*((1-delta)^i)...
                    +D_1(k,i)*(1-(1-delta)^(k+1))*((1-delta)^i)+D_2(k,i)*((1-delta)^k);
                T((k-1)*30+i,(k)*30+i)=D_1(k,i)*((1-delta)^(k+1))*(1-delta)^i;
                T((k-1)*30+i,(k)*30+i-1)=D_1(k,i)*((1-delta)^(k+1))*(1-(1-delta)^i);
                T((k-1)*30+i,(k-1)*30+i-1)=D_0(k,i)*((1-delta)^k)*(1-(1-delta)^i)+D_1(k,i)*(1-(1-delta)^(k+1))*(1-(1-delta)^i);
                T((k-1)*30+i,(k-2)*30+i)=D_0(k,i)*(1-(1-delta)^k)*((1-delta)^i)+D_2(k,i)*(1-(1-delta)^k);
                T((k-1)*30+i,(k-2)*30+i-1)=D_0(k,i)*(1-(1-delta)^k)*(1-(1-delta)^i);
            end
        end
    elseif k==30
        for i=1:30
           if i==1
                T((k-1)*30+i,(k-1)*30+i)=D_0(k,i)*((1-delta)^k)...
                +D_1(k,i)+D_2(k,i)*((1-delta)^k)*(1-(1-delta)^(i+1));
                T((k-1)*30+i,(k-1)*30+i+1)=D_2(k,i)*((1-delta)^k)*(1-delta)^(i+1);
                T((k-1)*30+i,(k-2)*30+i)=D_0(k,i)*(1-(1-delta)^k)+D_2(k,i)*(1-(1-delta)^k)*(1-(1-delta)^(i+1));
                T((k-1)*30+i,(k-2)*30+i+1)=D_2(k,i)*(1-(1-delta)^k)*((1-delta)^(i+1));

            elseif i<30
                T((k-1)*30+i,(k-1)*30+i)=D_0(k,i)*((1-delta)^k)*((1-delta)^i)...
                    +D_1(k,i)*((1-delta)^i)+D_2(k,i)*((1-delta)^k)*(1-(1-delta)^(i+1));
                T((k-1)*30+i,(k-1)*30+i+1)=D_2(k,i)*((1-delta)^k)*(1-delta)^(i+1);
                T((k-1)*30+i,(k-1)*30+i-1)=D_0(k,i)*((1-delta)^k)*(1-(1-delta)^i)+D_1(k,i)*(1-(1-delta)^i);
                T((k-1)*30+i,(k-2)*30+i)=D_0(k,i)*(1-(1-delta)^k)*((1-delta)^i)+D_2(k,i)*(1-(1-delta)^k)*(1-(1-delta)^(i+1));
                T((k-1)*30+i,(k-2)*30+i-1)=D_0(k,i)*(1-(1-delta)^k)*(1-(1-delta)^i);
                T((k-1)*30+i,(k-2)*30+i+1)=D_2(k,i)*(1-(1-delta)^k)*((1-delta)^(i+1));
            elseif i==30
                T((k-1)*30+i,(k-1)*30+i)=D_0(k,i)*((1-delta)^k)*((1-delta)^i)...
                    +D_1(k,i)*((1-delta)^i)+D_2(k,i)*((1-delta)^k);
                T((k-1)*30+i,(k-1)*30+i-1)=D_0(k,i)*((1-delta)^k)*(1-(1-delta)^i)+D_1(k,i)*(1-(1-delta)^i);
                T((k-1)*30+i,(k-2)*30+i)=D_0(k,i)*(1-(1-delta)^k)*((1-delta)^i)+D_2(k,i)*(1-(1-delta)^k);
                T((k-1)*30+i,(k-2)*30+i-1)=D_0(k,i)*(1-(1-delta)^k)*(1-(1-delta)^i);
            end
        end
    end
end

initial = [1,zeros(1,899)];

figure(3);%10 periods
A1=reshape((initial*(T^10))',30,30);
mesh(A1);
xlabel('Firm1 Knowledge'); ylabel('Firm2 Knowledge'); zlabel('Density');
title('Distribution of states after 10 periods');

figure(4);%20 periods
A2=reshape((initial*(T^20))',30,30);
mesh(A2);
xlabel('Firm1 Knowledge'); ylabel('Firm2 Knowledge'); zlabel('Density');
title('Distribution of states after 20 periods');


figure(5);%30 periods
A3=reshape((initial*(T^30))',30,30);
mesh(A3);
xlabel('Firm1 Knowledge'); ylabel('Firm2 Knowledge'); zlabel('Density');
title('Distribution of states after 30 periods');

figure(6);%Steady State
A4=reshape((initial*(T^900))',30,30);
mesh(A4);
xlabel('Firm1 Knowledge'); ylabel('Firm2 Knowledge'); zlabel('Density');
title('Stationary Distribution of states');