function  Xi = CO2Subproblem(CO2, Ac, bc, Bc, Bc0, dc, alpha, beta, rou, X, X0, t, i, m_low_bound)

Parameters;

Xi_ini      =  X(:,i);  %Initialize the decision for agent i

Aeq1        =  Ac{i,1};
beq1        =  bc{i, 1};

Aeq2        =  zeros(2, 3*H);
beq2        =  zeros(2,1);

Aeq2(1,1:3) =  [ 1,  0,  0 ];
beq2(1)     =  CO2(i,t);

Aeq2(2,1:3) =  [ 0, CO2(i,t), -1 ];
beq2(2)     =  0;

Aeq         =  [ Aeq1; Aeq2 ];
beq         =  [ beq1; beq2 ];


A1          =  [ 0,  1,  0 ];
Aneq1       =  zeros(H,3*H);
bneq1       =  zeros(H,1);
for tau = 1 : H
    Aneq1(tau, (tau-1)*3+1:tau*3) = A1;
    bneq1(tau) =  m_up;
end

Aneq2       =  zeros(H, 3*H);
bneq2       =  zeros(H,1);
A2          =  [ 0,  -1,  0 ];
for tau = 1 : H
    Aneq2(tau, (tau-1)*3+1:tau*3) = A2;
    bneq2(tau) = -m_low_bound(i, t+tau-1);
end


Aneq3   =  zeros(H, 3*H);
bneq3   =  zeros(H,1);
A3      =  [ 1 , 0,  0 ];
for tau = 1 : H
    Aneq3(tau, (tau-1)*3+1:tau*3) = A3;
    bneq3(tau) = C_up;
end


Aneq4   =  zeros(H, 3*H);
bneq4   =  zeros(H,1);
A4      =  [ -1,  0,  0];
for tau = 1 : H
    Aneq4(tau, (tau-1)*3+1:tau*3) = A4;
    bneq4(tau) = -C_low;
end


Aneq5   =  zeros(H, 3*H);
bneq5   =  zeros(H,1);
for tau = 2 : H
    Aneq5(tau, (tau-1)*3+1:tau*3) = [ m_low_bound(i, t+tau-1), C_low, -1];
    bneq5(tau) = m_low_bound(i, t+tau-1)*C_low;
end


Aneq6   = zeros(H, 3*H);
bneq6   = zeros(H,1);
for tau = 2 : H
    Aneq6(tau, (tau-1)*3+1:tau*3) = [m_up, C_up, -1];
    bneq6(tau) = m_up*C_up;
end


Aneq7   = zeros(H, 3*H);
bneq7   = zeros(H,1);
for tau = 2 : H
    Aneq7(tau, (tau-1)*3+1:tau*3) = [-m_low_bound(i, t+tau-1), -C_up, 1];
    bneq7(tau) = -m_low_bound(i, t+tau-1)*C_up;
end


Aneq8   = zeros(H, 3*H);
bneq8   = zeros(H,1);
for tau = 2 : H
    Aneq8(tau, (tau-1)*3+1:tau*3) = [-m_up, -C_low, 1];
    bneq8(tau) = -m_up*C_low;
end


Aneq    =  [ Aneq1;  Aneq2;  Aneq3;   Aneq4;   Aneq5;  Aneq6;  Aneq7;  Aneq8 ];
bneq    =  [ bneq1;  bneq2;  bneq3;   bneq4;   bneq5;  bneq6;  bneq7;  bneq8 ];

options = optimoptions('fmincon','Display','off','Algorithm','sqp');


Xi      = fmincon(@(Xi)CO2LocalAgent(Xi, Bc, Bc0, dc, alpha, beta, rou, X, X0, t, i, m_low_bound), Xi_ini, Aneq, bneq, Aeq, beq, [], [], [], options);

end