function [Bc, Bc0, dc]=UpdateParam2(Bc, Bc0, dc)
N=20;
H=10;    %planning horizon
m_sum_up=8; 


    for tau=1:H
         A1=[-1   0    0];
        Bc0(tau, 3*(tau-1)+1: 3*tau)=A1;        
    end

    
    for i=1:N
        for tau=1:H
            A2=[0  1  0];
            Bc{i,1}(tau, 3*(tau-1)+1:3*tau)=A2;
        end
    end
    
    for tau=1:H
        dc(tau)=m_sum_up;
    end

end