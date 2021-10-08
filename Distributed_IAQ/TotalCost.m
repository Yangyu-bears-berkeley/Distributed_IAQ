%function f=TotalCost()
clear all;
%clc;

load allTC.mat;
Tc=15;
kf=0.08;

f=0;
for t=1:T
    f=f+(Cp*(1-dr(t))*(To(t)-Tc)*sum(mz0(:,t))+kf*(sum(mz0(:,t)))^2)*Delta/3600*Price(t);
    for i=1:N
        f=f+(Cp*dr(t)*mz0(i,t)*(Ti0(i,t)-Tc))*Delta/3600*Price(t);
    end
end