function [A, Ci, Di, Fi, Gi]= ComputeParam( )

Parameters;

Fi  =  zeros(N,1);
Gi  =  zeros(N,T);
for i = 1:N
    Fi(i) = -Delta/m(i);
    for tau = 1:T
        Gi(i,tau) = Delta*Na(i,tau)*Cg/m(i)*10^6;
    end
end
Gi = [Gi, Gi];


R = inf*ones(N,N);
for i = 1:N
    for j = 1:N
        if i == j
            R(i,j) = 50;
        else
            if V(i,j) == 1
                R(i,j) = 14;
            end
        end
    end
end


A = zeros(N,N);
for i = 1 : N
    A(i, i) = 1;
    for j = 1 : N
        A(i,i) = A(i,i) - Delta/( R(i,j)*C(i) );
        if j ~= i
            A(i,j) = Delta/( C(i)*R(i,j) );
        end
    end
end

Ci = zeros( N, 1 );
Di = zeros( N, T );
for i = 1:N
    Ci(i) = -Delta*Cp/C(i);
    for tau = 1 : T
        Di(i,tau) = Delta*To(tau)/(C(i)*R(i, i)) + Delta*Q(i,tau)/C(i);
    end
end

Di = [Di, Di];

end