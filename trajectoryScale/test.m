clc,clear,close all;
%% trajectory generation

dt=0.01;
time=0:dt:2;

q=(time-1).^3+1; %sin(time);

plot(time,q);
hold on;
%plot(time,dq);
%plot(time,ddq);

%% trajectory scaling
c=2; %scaling factor
%[nq,ndq,nddq,ntime]=trajLinearScaler(q,dq,ddq,time,c);

[nq,ndq,nddq,ntime]=trajSectorScaler(q,3,4,time,c);
% 
figure;
plot(ntime,nq);
hold on;
plot(ntime,ndq);
plot(ntime,nddq);

