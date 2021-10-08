function [Dr, flag]=Updatedr(Dr, Delta_dr, CO2, Ti_f, t)

% Note: set the minimum fresh air infusion 0.1 (10%)

Parameters; 

flag = 1;
for tau = 1 : H
    if  sum(CO2(:, t+tau)>C_up) || sum(Ti_f(:, t+tau)<T_low)
        k=find (Dr(1:tau)>=0.1, 1, 'last');
        if isempty(k)
            flag=0;
            disp('error!')
        else
            Dr(k) = Dr(k) - Delta_dr;
        end
    end
    
end