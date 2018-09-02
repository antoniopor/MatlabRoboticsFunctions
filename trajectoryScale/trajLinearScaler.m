function [nq,ndq,nddq,nt]=trajLinearScaler(q,dq,ddq,t,c)
%TRAJLINEARSCALER performs the linear scaling of a trajecotory
%

nt=t*c;
nq=q;
dim=length(dq);
ndq=zeros(1,dim);
nddq=zeros(1,dim);

c1=1/c;
c2=1/(c^2);
step=t(2)-t(1);

ndq(1)=c1*dq(1);
nddq(1)=c2*ddq(1);

for i=2:(dim-2)
ndq(i)=c1*(q(i)-q(i-1))/step;
nddq(i)=c2*(q(i+1)-2*q(i)+q(i-1))/step^2;
end
i=dim;
ndq(i)=c1*(q(i)-q(i-1))/step;
nddq(i)=c2*(2*q(i)+q(i-1))/step^2;

end

