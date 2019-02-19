function [w0,w1,w2]=Ws(V,tr_pr) 

s = size(tr_pr,1);
t_p = tr_pr;
tr_pr_0 = t_p(1:s-1,:); 
tr_pr_1 = t_p(2:s,:);

w0 = tr_pr_0*V*tr_pr_0';
w1 = tr_pr_1*V*tr_pr_0';
w2=tr_pr_0*V*tr_pr_1';

end