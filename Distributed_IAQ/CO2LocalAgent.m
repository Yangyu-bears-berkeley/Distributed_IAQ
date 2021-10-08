function  Ji = CO2LocalAgent(Xi, Bc, Bc0, dc, alpha, beta, rou, X, X0, t, i, m_low_bound)

Parameters;

Ji = 0;


As1     =  zeros(H, 3*H);
As2     =  zeros(H, 3*H);
for tau =  1 : H
    As1(tau, 3*(tau-1)+2)  =  1;
    As2(tau, 3*(tau-1)+3)  =  1;
end
s1 = As1*X0;
s2 = As2*X0;


for tau = 1 : H
    Ji  = Ji + (Xi(3*(tau-1)+2) - m_low_bound(i,t+tau-1))^2;
end

Ji      =  Ji + alpha'*(Bc{i,1}*Xi);
temp1   =  Bc{i,1}*Xi+s1-dc;
for j = 1 : N
    if j ~= i
        temp1 = temp1 + Bc{j, 1}*X(:,j);
    end
end
Ji = Ji + rou/2*norm(temp1, 2)^2;


Ji     =  Ji + beta'*(Bc{i,1}*Xi);
temp2  =  Bc{i,1}*Xi + Bc0*X0 + s2;
for j  =  1 : N
    if j ~= i
        temp2 = temp2 + Bc{j,1}*X(:,j);
    end
end
Ji = Ji + rou/2*norm(temp2, 2)^2;


end