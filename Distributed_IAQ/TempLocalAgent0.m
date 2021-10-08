function J0 = TempLocalAgent0(X0, Bd0,  Bd, cd, X, gamma, eta, rou, Price, t, To, Dr)

Parameters; 


AY  =  zeros(H, 3*H);
As1 =  zeros(H, 3*H);
As2 =  zeros(H, 3*H);
for tau = 1 : H
    AY( tau, 3*(tau-1) + 1 ) = 1;
    As1(tau, 3*(tau-1) + 2 ) = 1;
    As2(tau, 3*(tau-1) + 3 ) = 1;
end

Y      =  AY*X0;
s1     =  As1*X0;
s2     =  As2*X0;
temp1  =  Bd0*X0 + s1;
temp2  =  -cd + s2;

J0 = gamma*temp1;

for i = 1 : N
    temp1 = temp1 + Bd{i,1}*X(:,i);
    temp2 = temp2 + Bd{i,1}*X(:,i);
end
J0 = J0 + rou/2*norm(temp1)^2 + eta*s2 + rou/2*norm(temp2)^2;

for tau = 1 : H
   J0 = J0 + (Cp*(1-Dr(tau))*(To(t+tau-1)-Tc)*Y(tau) + kf*(Y(tau))^2)*Delta/3600*Price(t+tau-1);
end
end