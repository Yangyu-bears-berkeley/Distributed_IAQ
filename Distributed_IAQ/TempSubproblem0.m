function X0_new = TempSubproblem0(Bd0, Bd, cd, X, X0, gamma, eta, rou, Price, t, To, Dr)


Parameters;


Aneq  =  [-eye(H,H),  zeros(H, 2*H);
          zeros(H,H), -eye(H,H), zeros(H,H);
          zeros(H, 2*H), -eye(H,H)];
bneq  =  zeros(3*H,1);


options = optimoptions('fmincon','Display', 'off','MaxIter', 5000,  'MaxFunctionEvaluation',20000);
X0_new=fmincon(@(X0)TempLocalAgent0(X0, Bd0,Bd, cd,X, gamma, eta, rou, Price, t, To, Dr), X0, Aneq, bneq, [], [], [], [], [], options);

end