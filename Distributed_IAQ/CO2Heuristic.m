function  [mz0, CO2, Zi0]= CO2Heuristic( mz0, Zi0, CO2, Na, X, t, Dr )


Parameters;

Cz0=zeros(1,H);

Az = zeros(H, 3*H);
Am = zeros(H, 3*H);
for tau = 1 : H
    Az( tau, 3*(tau-1) + 3 ) = 1;
    Am( tau, 3*(tau-1) + 2 ) = 1;
end
Zi  = (Az*X)';
%mzi = (Am*X)';


for tau = 1 : H
    for i = 1 : N
        Zi0(i,t + tau-1 ) =  Zi(i,tau);
        mz0(i,t + tau-1 ) =  min( Zi0(i,t + tau-1)/CO2(i,t + tau - 1), m_up);
        if sum( mz0(:, t + tau - 1) ) > 0
            Cz0(tau) = ( 1 - Dr(tau) )*Co + Dr(tau)*sum( mz0(:,t + tau - 1).*CO2(:, t + tau - 1) )/sum( mz0(:, t + tau - 1) );
        else
            Cz0(tau) = Co;
        end
        CO2(i, t + tau ) = CO2(i,t + tau - 1) + Delta*Na(i,t + tau - 1)*Cg/m(i)*10^6 + Delta*Cz0(tau)/m(i)*mz0(i,t + tau - 1)-Delta/m(i)*Zi0(i,t + tau - 1);
    end
end

end

