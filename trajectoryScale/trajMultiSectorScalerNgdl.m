function [nq,ndq,nddq,ntime] = trajMultiSectorScalerNgdl(q,dq,ddq,t,scaleFactor,wypntlst)
%TRAJMULTISECTORSCALERNGDL Summary of this function goes here
%   Detailed explanation goes here
nq=q;
ndq=dq;
nddq=ddq;
for gdl=1:size(q,1)
[nq(gdl,:),ndq(gdl,:),nddq(gdl,:),ntime]=trajMultiSectorScaler(q(gdl,:),dq(gdl,:),ddq(gdl,:),t,scaleFactor,wypntlst)
end
end

