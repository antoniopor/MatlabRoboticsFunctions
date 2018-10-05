function [nq,ndq,nddq,nt] = trajSectorScaler(q,dqi,ddqi,t,tau)
% TRAJSECTORSCALER Summary of this function goes here
% Detailed explanation goes here

nt=t;
nt=nt-t(1);
nt=nt*tau;
nt=nt+t(1);
nq=q;

dim=length(q);
ndq=zeros(1,dim);
nddq=zeros(1,dim);

ndq(1)=dqi;
for i=2:(dim)
ndq(i)=(q(i)-q(i-1))/(nt(i)-nt(i-1));
end

nddq(1)=ddqi;
% for i=2:(dim)
% nddq(i)=(ndq(i)-ndq(i-1))/(nt(i)-nt(i-1));
% end

for i=2:(dim-1)
nddq(i)=(nq(i+1)-2*nq(i)+nq(i-1))/(nt(i)-nt(i-1))^2;
end
i=dim;
nddq(i)=(ndq(i)-ndq(i-1))/(nt(i)-nt(i-1));

end

