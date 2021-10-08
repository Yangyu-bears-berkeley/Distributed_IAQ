function   Ti_f=ComputeTemp(Ti_f, A, Di, Ci, mz0, t)

Parameters;

for tau = 1 : H
    for i = 1 : N
        Ti_f(i, t + tau) = Di(i, t + tau - 1) + Ci(i)* mz0(i, t+tau-1)*(Ti_f(i, t+tau-1)-Tc);
        for j = 1 : N
            Ti_f(i,t + tau) = Ti_f(i, t + tau) + A(i,j)*Ti_f(j, t + tau - 1);
        end
    end
end

end