clc,clear,close all;
%% trajectory generation

dt=0.01;
time=0:dt:10;
q=sin(time);
dq=cos(time);
ddq=-sin(time);

plot(time,q);
hold on;
plot(time,dq);
plot(time,ddq);

%% trajectory scaling
c=10; %scaling factor
[nq,ndq,nddq,ntime]=trajLinearScaler(q,dq,ddq,time,c);
% 
figure;
plot(ntime,nq);
hold on;
plot(ntime,ndq);
plot(ntime,nddq);

