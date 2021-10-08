function  [Ad, bd, X, X0, TempResidual] = TempMain( Price, To, A, Ci, Di, V,  t, Ti0, Dr, N, H)



lambda         =  3*ones( (H-1), N );   % lagrangian multipliers
gamma          =  5*ones(1,H);
eta            =  3*ones(1,H);
rou            =  5;
K              =  20;                   % maximum iterations
TempResidual   =  zeros(1,K);
TempEnergyUse  =  zeros(1,K);


X0             =  zeros( 3*H, 1 );     % decision variables
X              =  zeros( 3*H, N );




[Ad, bd, Bd, Bd0, cd] = TempUpdateParam( A, Ci, Di, t );

for k = 1 : K
      X0 = TempSubproblem0( Bd0, Bd, cd, X, X0, gamma, eta, rou, Price, t, To, Dr );
      disp( ['Temp:',  '  iter = ', num2str(k)] );
    
    for i = 1 : N
       % disp( ['Temp:', ' t = ', num2str(t), '  iter = ', num2str(k), ' zone = ', num2str(i)] );
        X(:,i) = TempSubproblem( Ad, bd, Bd, Bd0,  cd, X, X0, lambda, gamma, eta, rou, i, Price, Ti0, t, V, Dr);
    end
    
    [lambda, gamma, eta, TempResidual(k)] = TempDualUpdate(Ad, Bd, Bd0, bd, cd, V, X, X0, lambda, gamma, eta, rou);
    
    if TempResidual(k) <= 0.1*N  % stop iteration
        break;
    end
    
    TempEnergyUse(k) = HVAC_Cost(Bd0, X,X0, Price,To, t, Dr);

end








