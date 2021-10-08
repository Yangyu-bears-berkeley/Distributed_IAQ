function  [ alpha, beta, residual1 ]=  CO2DualUpdate( alpha, beta, rou, X, X0, Bc, Bc0, dc )

Parameters;

As1 = zeros(H, 3*H);
As2 = zeros(H, 3*H);
for tau = 1 : H
    As1( tau, 3*(tau-1) + 2) = 1;
    As2( tau, 3*(tau-1) + 3) = 1;
end
s1 = As1*X0;
s2 = As2*X0;

temp1 = s1 - dc;
for i = 1:N
    temp1 = temp1 + Bc{i,1}*X(:,i);
end
alpha = alpha + rou*temp1;


temp2 = Bc0*X0 + s2;
for i = 1 : N
    temp2 = temp2 + Bc{i,1}*X(:,i);
end

beta = beta + rou*temp2;


residual1 = norm(temp1,2) + norm(temp2,2);    %residual error
end
