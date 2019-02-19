function [d0,d1,d2] = Ds(p,p_1,v)
d0 = 1./(1+exp(v-p)+exp(v-p_1')); 
d1 = exp(v-p)./(1+exp(v-p)+exp(v-p_1'));
d2 = exp(v-p_1')./(1+exp(v-p)+exp(v-p_1'));
end