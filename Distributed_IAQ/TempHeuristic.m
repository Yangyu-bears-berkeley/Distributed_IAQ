function [ mz0, Xi0, Ti0, Y0 ] = TempHeuristic( Price, A, Di, Ci, To, X, mz0, Xi0, Ti0, Y0,  t, Dr )

Parameters;



AX = zeros( H, 3*H );
AT = zeros( H, 3*H );
for tau = 1 : H
    AX( tau, (tau-1)*3 + 3 ) = 1;
    AT( tau, (tau-1)*3 + 1 ) = 1;
end
Xi = (AX*X)';
Ti = (AT*X)';



for tau = 1 : H
    for i = 1 : N
        Xi0( i, t + tau-1 )   =  Xi(i, tau); 
        mz0( i, t + tau-1 )   =  Xi0(i, t + tau - 1)/( Ti0(i,t + tau - 1) - Tc );
        Ti0( i, t + tau )     =  Di(i, t + tau - 1) + Ci(i)*Xi0( i, t + tau-1 );
        for j = 1 : N
            Ti0( i, t + tau ) =  Ti0(i, t+tau) + A(i,j)*Ti0(j, t + tau-1 );
        end
    end
    Y0(t + tau-1 )=sum( mz0(:,t+tau-1) );
end

fopt = 0;
for tau = 1 : H
    
    fopt = fopt + (Cp*(1-Dr(tau))*( To(t+tau-1) - Tc )*Y0(t+tau-1) + kf*( Y0(t+tau-1) )^2 + Cp*Dr(tau)*sum( Xi0(:,t+tau-1)) )*Delta/3600*Price(t+tau-1);

end
