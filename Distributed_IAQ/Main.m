%function Main
clear all;
clc;

Parameters;   % load the parameters
[A, Ci, Di, Fi, Gi]= ComputeParam();

mz0        =   zeros(N,2*T);
Xi0        =   zeros(N,2*T);
Ti0        =   zeros(N,2*T);
Ti_f       =   zeros(N,2*T);
Ti0(:,1)   =   T0;                            % initial zone temperature
Ti_f(:, 1) =   T0;
Y0         =   zeros(1,2*T);

CO2        =   zeros(N, 2*T);                  % CO2
CO2(:, 1)  =   ones(N,1)*Co;                   % initial zone CO2
Zi0        =   zeros(N, 2*T);                  % auxiliary variable Zi = mzi*CO2
dr         =   zeros(1, 2*T);


iter           = zeros(1,T);
computingTime  = zeros(1,T);

%load allt41.mat;

for t =  1 : T
    
    tic;
    
    Dr = ones(1,H)*0.8;
    
    count = 1;   %outer-loop
    
    %load allcount13.mat;
    while (1)
           
        disp( ['t = ', num2str(t), ' count = ', num2str(count) ] );
        
        
        %% Upper-level thermal control 
        [Ad, bd, X, ~, TempResidual]  =   TempMain( Price, To, A, Ci, Di, V,  t, Ti_f, Dr, N, H );
        [m_low_bound, Xi0, Ti0, Y0]   =   TempHeuristic( Price, A, Di, Ci, To, X, mz0, Xi0, Ti_f, Y0, t, Dr );
        
        %% Lower-level IAQ control 
        [ X,   X0,  CO2Residual]      =   CO2Main( CO2, Fi, Gi, m, t, Dr, m_low_bound );
        [ mz0, CO2, Zi0]              =   CO2Heuristic( m_low_bound, Zi0, CO2, Na, X, t, Dr );
        
        
        Ti_f = ComputeTemp( Ti_f, A, Di, Ci, mz0, t);
        
        
        if  CO2(:,t+1:t+H-1) <= C_up + 10  & Ti_f(:,t+1:t+H-1) >= T_low-0.1  % check thermal comfort and IAQ
            break;
        else
            max( max( CO2(:,t+1:t+H-1) ) )
            min( min( Ti_f(:,t+1:t+H-1) ) )
            count = count + 1;
            [Dr, flag] = Updatedr(Dr, Delta_dr, CO2, Ti_f, t);   % regulate fresh air infusion
            if ~flag
                break;
            end
        end
        
    end
    dr(t)             =  Dr(1);
    iter(t)           =  count;     % record the number of iterations to regulate fresh air infusion
    computingTime(t)  =  toc;       % record the computing time for each epoch
    
end

save ./Result./all48.mat;


