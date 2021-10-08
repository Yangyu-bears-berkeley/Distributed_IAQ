function X0 = CO2Subproblem0(Bc, Bc0, dc, Alpha, Beta, rou, X, X0)

Parameters;

X0_ini = X0;      %Initialization

%we have Y >=0, s1 >=0, and s2>=0

Aneq = [ -eye(H,H),  zeros(H, 2*H);
         zeros(H,H), -eye(H,H), zeros(H,H);
         zeros(H, 2*H), -eye(H,H)];
bneq = zeros(3*H,1);



options = optimoptions('fmincon','Display', 'off','MaxIter', 5000,  'MaxFunctionEvaluation',20000);
X0 = fmincon(@(X0)CO2LocalAgent0(X0, Bc, Bc0, dc, Alpha, Beta, rou, X), X0_ini, Aneq, bneq, [], [], [], [], [], options);

end