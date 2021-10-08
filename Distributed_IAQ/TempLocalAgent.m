function Ji=TempLocalAgent(Xi, X, Ad, bd, Bd, Bd0, X0, cd, lambda, gamma, eta, rou, i, Price, t, V, Dr)
Parameters;

Ji = 0;

As1 =  zeros(H, 3*H);
As2 =  zeros(H, 3*H);
for tau = 1 : H
    As1(tau,  3*(tau-1) + 2 )  =  1;
    As2(tau,  3*(tau-1) + 3 )  =  1;
end
s1 = As1*X0;
s2 = As2*X0;


for tau = 1 : H
    Ji = Ji + (Cp*Dr(tau)*Xi(3*tau))*Delta/3600*Price(t+tau-1);
end

for j= 1 : N
    if V(j, i) == 1
        Ji = Ji + lambda(:,j)'*Ad{j,i}*Xi;
        temp2=0;
        for  l=1:N
            if l~=i && V(j, l)==1
                temp2=temp2+Ad{j, l}*X(:,l);
            end
        end
        Ji=Ji+rou/2*norm(Ad{j,i}*Xi+temp2-bd{j,1})^2;
    end
end

temp3=Bd0*X0+s1+Bd{i,1}*Xi;
for j = 1:N
    if j ~= i
        temp3 = temp3+Bd{j,1}*X(:,j);
    end
end

Ji=Ji + gamma*Bd{i,1}*Xi + rou/2*norm(temp3)^2;

temp4 = s2 - cd + Bd{i,1}*Xi;
for j = 1:N
    if j~=i
        temp4 = temp4+Bd{j,1}*X(:,j);
    end
end

Ji=Ji + eta*Bd{i,1}*Xi + rou/2*norm(temp4)^2;

end

