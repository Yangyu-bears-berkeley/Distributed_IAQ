%function ComputeTotalCost
clear all;
clc;

load all0329.mat;
Cp=1.012;
Tc=15;    %outlet air temperature of AHU
kf=0.08;
N=20; %the number of agents
Delta=30*60;  %decision interval


fopt=0;
for t=1:T
    fopt=fopt+(Cp*(1-dr(t))*(To(t)-Tc)*sum(mz0(:,t))+kf*(sum(mz0(:,t)))^2)*Delta/3600*Price(t);
    for i=1:N
        fopt=fopt+(Cp*dr(t)*mz0(i, t)*(Ti_final(i,t)-Tc))*Delta/3600*Price(t);
    end
end