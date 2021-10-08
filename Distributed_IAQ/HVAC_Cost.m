function  f=HVAC_Cost(Bd0, X,X0, Price,To, t, Dr)
H=10;     % the length of planning horizon
Cp=1.012;
Tc=15;    %outlet air temperature of AHU
kf=0.08;
N=20; %the number of thermal zones
Delta=30*60;  %decision interval



Ti=zeros(N,H);      %indoor air temperature of each zone
mzi=zeros(N,H);    %outlet air flow rate to each zone
XI=zeros(N,H);        %intermediate variable

AT=zeros(H, 3*H);
Amzi=zeros(H, 3*H);
AXI=zeros(H, 3*H);
for tau=1:H
    AT(tau, (tau-1)*3+1)=1;
    Amzi(tau, (tau-1)*3+2)=1;
    AXI(tau, (tau-1)*3+3)=1;
end
%
for i=1:N
    Ti(i,:)=(AT*X(:,i))';          %Extract Ti from X
    mzi(i, :)=(Amzi*X(:,i))';    %Extract mzi from X
    XI(i, :)=(AXI*X(:,i))';         %Extract XI from X
end
Y=(Bd0*X0)'; %Extract Y from X0


f=0;
for tau=1:H
   f=f+(Cp*(1-Dr(tau))*(To(t+tau-1)-Tc)*Y(tau)+kf*Y(tau)^2+Cp*Dr(tau)*sum(XI(:,tau)))*Delta/3600*Price(t+tau-1);
end

end