function [ lambda, gamma, eta, residual ]= TempDualUpdate( Ad, Bd, Bd0, bd, cd, V, X, X0, lambda, gamma, eta, rou )


Parameters;

residual=0;  %residual error

As1 = zeros(H, 3*H);
As2 = zeros(H, 3*H);
for tau = 1 : H
    As1( tau,  3*(tau-1)+1 : 3*tau ) = [0   1    0];
    As2( tau,  3*(tau-1)+1 : 3*tau ) = [0   0    1];
end
s1 = As1*X0;
s2 = As2*X0;


temp2 = Bd0*X0 + s1;
temp3 = -cd + s2;
for i = 1 : N
    temp1 = -bd{i,1};
    temp2 = temp2 + Bd{i,1}*X(:,i);
    temp3 = temp3 + Bd{i,1}*X(:,i);
    for j = 1 : N
        if V(i, j) == 1
            temp1 = temp1 + Ad{i,j}*X(:,j);
        end
    end
    lambda(:, i) = lambda(:,i) + rou*temp1;
    
    residual=residual + norm( temp1, 2 );
end
gamma =  gamma + rou*temp2';
eta   =  eta + rou*temp3';


residual = residual + norm( temp2, 2 ) + norm( temp3, 2 );

end