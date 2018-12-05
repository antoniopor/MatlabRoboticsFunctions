%% trajectory generation
clc,clear,close all;
dt=0.01;
time=0:dt:2;

q1=(time-1).^3+1;%time.^2;%(time-1).^3+1; %sin(time);
q2=-(time-1).^3+2;%time.^2;%(time-1).^3+1; %sin(time);

c=1; %scaling factor
[q1,dq1,ddq1,ntime]=trajSectorScaler(q1,0,0,time,c);
[q2,dq2,ddq2,ntime]=trajSectorScaler(q2,0,0,time,c);

nq=[q1;q2];
ndq=[dq1;dq2];
nddq=[ddq1;ddq2];
plot(time,nq);
hold on;
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

%% multi sector trajectory scaling N gdl
waypoint=[1,51,101,151,201];
c=[1,1.1,0.9,1.2]; %scaling factorc;
[nq,ndq,nddq,ntime]=trajMultiSectorScalerNgdl(nq,ndq,nddq,ntime,c,waypoint);
% 
figure;
plot(ntime,nq);
hold on;
plot(ntime,ndq);
plot(ntime,nddq);

