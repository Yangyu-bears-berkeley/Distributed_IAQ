function [Ad, bd, Bd, Bd0, cd] = TempUpdateParam(A, Ci, Di, t)

Parameters;

A_bar  =  cell( N, N );
D_bar  =  cell( N, H );
for i  =  1:N
    A_bar{i,i} = [A(i,i),  0,  Ci(i)];
    for tau = 1:H
        D_bar{i,tau} = Di( i,t + tau-1 );
    end
    for j = 1:N
        if j ~= i
            A_bar{i,j} = [ A(i,j),   0,     0];
        end
    end
end


Ad = cell(N,N);
for i = 1:N
    Ad{i,i} = zeros(H-1,3*H);
    for tau = 1:H-1
        Ad{i,i}(tau, (tau-1)*3+1:tau*3) = A_bar{i,i};
        Ad{i,i}(tau, tau*3+1:(tau+1)*3) = -[1 0  0];   
    end
    
    for j = 1:N
        if j ~= i
            Ad{i,j} = zeros(H-1, 3*H);
            for tau = 1:H-1
                Ad{i,j}(tau, (tau-1)*3+1:tau*3) = A_bar{i,j};
            end
        end
    end
end

bd = cell(N,1);
for i = 1:N
    bd{i,1} = zeros(H-1,1);
    for tau = 1:H-1
        bd{i,1}(tau) = -D_bar{i,tau};
    end
end


B_bar = cell(N,1);
for i = 1:N
    B_bar{i,1} = [0, 1, 0];
end


Bd0 = zeros(H,3*H);
for tau = 1:H
    Bd0(tau, tau) = -1;
end

Bd = cell(N,1);
for i = 1:N
    Bd{i,1} = zeros(H, 3*H);
    for tau = 1:H
        Bd{i,1}(tau, (tau-1)*3+1:tau*3) = B_bar{i,1};
    end
end

cd = zeros(H,1);
for tau = 1:H
    cd(tau) = m_sum_up;
end