function [nq,ndq,nddq,ntime] = trajMultiSectorScaler(q,dq,ddq,t,scaleFactor,wypntlst)
% TRAJMULTISECTORSCALER perform a linear time scaling of specified sectors
% of 1DOF of a trajecotry
% q,dq,ddq are the position sample of path, 
% t is the time corrispondig of
% scaleFactor the vector of facotir of scaling of the time
% wypntlst containing the index of each waypoint of inside q

nq=q;
ndq=dq;
nddq=ddq;
ntime=t;
k=1;
dqi=dq(1);
ddqi=dq(1);
nwypnt=size(wypntlst,2);
for i=1:nwypnt-1
    sbpath=q(wypntlst(i):wypntlst(i+1));
    sbtime=ntime(wypntlst(i):wypntlst(i+1));
    [snq,sndq,snddq,sntime]=trajSectorScaler(sbpath,dqi,ddqi,sbtime,scaleFactor(k));
    nq(wypntlst(i):wypntlst(i+1))=snq;
    ndq(wypntlst(i):wypntlst(i+1))=sndq;
    nddq(wypntlst(i):wypntlst(i+1))=snddq;
    timeVariation=sntime(end)-ntime(wypntlst(i+1));
    ntime(wypntlst(i):wypntlst(i+1))=sntime;
    if i<nwypnt-1
         ntime(wypntlst(i+1)+1:end)=ntime(wypntlst(i+1)+1:end)+timeVariation;
    end
    k=k+1;
    dqi=sndq(end);
    ddqi=snddq(end);
end

end

