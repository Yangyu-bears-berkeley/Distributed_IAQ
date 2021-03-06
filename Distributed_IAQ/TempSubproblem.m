function   Xi= TempSubproblem( Ad, bd, Bd, Bd0,  cd, X, X0, lambda, gamma, eta, rou, i,Price, Ti0, t, V,  Dr)



Parameters;


Xi_ini = X(:,i);

%Initial zone temperature
Aeq         =  zeros(2, 3*H);
Aeq(1,1)    =  1;
beq(1)      =  Ti0(i,t);

%i
%Ti0(i,t)

Aeq(2, 1:3) =  [ 0, Ti0(i,t), -1 ];
beq(2)      =  0;


Aneq1 = zeros(H, 3*H);
bneq1 = zeros(H, 1);
for tau = 1:H
    Aneq1( tau, (tau-1)*3+1:tau*3 ) = [0  1  0];
    bneq1(tau) = m_up;
end


Aneq2 =  zeros(H, 3*H);
bneq2 =  zeros(H,1);
for tau = 1:H
    Aneq2(tau, (tau-1)*3+1:tau*3) =[0 -1 0];
    bneq2(tau) = -m_low;
end


Aneq3 =  zeros(H, 3*H);
bneq3 =  zeros(H, 1);
if t == 1
    for tau = 2:H
        Aneq3(tau, (tau-1)*3+1:tau*3) = [1 , 0,  0];
        bneq3(tau) = T_up;
    end
else
    for tau = 1:H
        Aneq3(tau, (tau-1)*3+1:tau*3) = [1 , 0,  0];
        bneq3(tau) = T_up;
    end
end


Aneq4 =  zeros(H, 3*H);
bneq4 =  zeros(H,1);
if t == 1
    for tau = 2:H
        Aneq4(tau, (tau-1)*3+1:tau*3) = [-1 0 0];
        bneq4(tau) = -T_low;
    end
else
    for tau = 1:H
        Aneq4(tau, (tau-1)*3+1:tau*3) = [-1 0 0];
        bneq4(tau) = -T_low;
    end
end


Aneq5 =  zeros(H, 3*H);
bneq5 =  zeros(H, 1);
for tau = 2:H
    Aneq5(tau, (tau-1)*3+1:tau*3) = [m_low, T_low-Tc  -1];
    bneq5(tau) = m_low*Tc+m_low*(T_low-Tc);
end


Aneq6 = zeros(H, 3*H);
bneq6 = zeros(H,1);
for tau = 2:H
    Aneq6(tau, (tau-1)*3 + 1 : tau*3) = [m_up, T_up-Tc, -1];
    bneq6(tau) =  m_up*Tc + m_up*(T_up-Tc);
end


Aneq7 =  zeros(H, 3*H);
bneq7 =  zeros(H,1);
for tau = 2:H
    Aneq7(tau, (tau-1)*3+1:tau*3) = [-m_low, -(T_up-Tc), 1];
    bneq7(tau) = -m_low*Tc-m_low*(T_up-Tc);
end


Aneq8 = zeros(H,  3*H);
bneq8 = zeros(H,1);
for tau = 2:H
    Aneq8(tau, (tau-1)*3+1:tau*3) = [-m_up, -(T_low-Tc), 1];
    bneq8(tau)=-m_up*(T_low-Tc)-m_up*Tc;
end


Aneq = [Aneq1; Aneq2; Aneq3; Aneq4; Aneq5; Aneq6; Aneq7; Aneq8];
bneq = [bneq1; bneq2; bneq3; bneq4; bneq5; bneq6; bneq7; bneq8];

options  =  optimoptions('fmincon','Display','off','Algorithm','sqp');
Xi       =  fmincon(@(Xi)TempLocalAgent(Xi, X, Ad, bd, Bd, Bd0, X0, cd, lambda, gamma, eta, rou, i, Price, t, V, Dr), Xi_ini, Aneq, bneq, Aeq, beq, [], [], [], options);


end