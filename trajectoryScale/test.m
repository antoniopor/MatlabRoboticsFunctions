%% trajectory generation
clc,clear,close all;
dt=0.01;
time=0:dt:2;

q=(time-1).^3+1;%time.^2;%(time-1).^3+1; %sin(time);
%dq=zeros(1,size(q,2));
%ddq=zeros(1,size(q,2));
plot(time,q);
hold on;
%plot(time,dq);
%plot(time,ddq);

%% trajectory scaling
c=1; %scaling factor
%[nq,ndq,nddq,ntime]=trajLinearScaler(q,dq,ddq,time,c);

[nq,ndq,nddq,ntime]=trajSectorScaler(q,0,0,time,c);
% 
figure;
plot(ntime,nq);
hold on;
plot(ntime,ndq);
plot(ntime,nddq);

%% multi sector trajectory scaling
waypoint=[1,51,101,151,201];
c=[1,1.1,0.9,1.2]; %scaling factorc;
[nq,ndq,nddq,ntime]=trajMultiSectorScaler(nq,ndq,nddq,ntime,c,waypoint);
% 
figure;
plot(ntime,nq);
hold on;
plot(ntime,ndq);
plot(ntime,nddq);

