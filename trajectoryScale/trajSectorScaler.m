function [nq,ndq,nddq,nt] = trajSectorScaler(q,dqi,ddqi,t,tau)
% TRAJSECTORSCALER Summary of this function goes here
% Detailed explanation goes here

nt=t*tau;
nq=q;

dim=length(q);
ndq=zeros(1,dim);
nddq=zeros(1,dim);

step=t(2)-t(1);
ndq(1)=dqi;
for i=2:(dim)
ndq(i)=(q(i)-q(i-1))/step;
end

nddq(1)=ddqi;
for i=2:(dim)
nddq(i)=(ndq(i)-ndq(i-1))/step;
end
end

