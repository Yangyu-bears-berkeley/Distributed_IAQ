function [ X, X0, residual2]= CO2Main(CO2, Fi,  Gi,  m, t, Dr, m_low_bound)


Parameters; 


Cz_old = Co*ones( 1, H );                             %initial CO2 of mixed air out of AHU


countMax   =   20;
count      =   1;
residual2  =   zeros( 1, countMax );                  % maximum iterations of outer loop
K          =   20;                                    % maximum iterations of inner loop

while count <= countMax                               % estimate Cz
    
    [Ac, bc, Bc, Bc0, dc]= CO2UpdateParam(Fi, Gi, Cz_old, m, t);
    
    X0       =  zeros( 3*H, 1 );
    X        =  zeros( 3*H, N );
    
    mzi      =  zeros(N, H);         
    CO2i     =  zeros(N,H);
    
    alpha    =  3*ones(H,1);     % initial lagrangian multipliers
    beta     =  2*ones(H,1);
    rou      =  5;
    residual =  zeros(1,K);      % residual error
      
    for k = 1 : K
        
        
    
        X0 = CO2Subproblem0( Bc, Bc0, dc, alpha, beta, rou, X, X0 );
        %disp( ['CO2: ', ' count = ', num2str(count), ' iter = ', num2str(k) ]);

        for i = 1 : N
            disp( ['CO2: ', ' t = ', num2str(t), ' count = ', num2str(count), ' iter = ', num2str(k), ' zone = ', num2str(i) ]);
            X(:,i) = CO2Subproblem( CO2, Ac, bc, Bc, Bc0, dc, alpha, beta, rou, X, X0, t, i, m_low_bound );
        end 
        
        [alpha, beta, residual(k)]=CO2DualUpdate(alpha, beta, rou, X,X0, Bc, Bc0, dc);
 
        if residual(k) <= 0.1*N
            break;
        end
        
    end
    
    for tau = 1 : H
        mzi( :, tau )  =  X( 3*(tau-1) + 2, : );
        CO2i(:, tau ) =   X( 3*(tau-1) + 1, : );
    end

    Cz_new = UpdateCz(CO2, mzi, CO2i, t, Dr);
    
    residual2(count)=norm( Cz_new - Cz_old, 2);
    if residual2(count) <= 20
        break;
    else
        Cz_old =  Cz_new;
        count  =  count + 1;
    end
end


end
