%function Parameters

load ./Data/T0_20.mat;
load ./Data/V_20.mat;
load ./Data/Na.mat;
Q =  Na*0.6;
Q = [Q, Q];



Na = [Na, Na];

N        =  20;                      % numbe of zones 
T        =  48;                      % optimization horizon
H        =  10;                      % prediction horizon
dr       =  0.8*ones(1, 2*T);        % fresh air infusion increment
Delta_dr =  0.05;


C     =  1.5*10^3*ones(1,N);            % KJ/K
Cp    =  1.012;                         % kJ/(kg.K)
Cg    =  40/(1000*3600);                % kg/s CO2 generation rate per occupant
m     =  C/Cp;                          % zone indoor air mass
Delta =  30*60;                         % computing epoch 1800s
Co    =  400;                           % outdoor CO2
K     =  20;                            % maximum iterations
kf    =  0.08;

C_low =  0;
C_up  =  800;                           % CO2 bounds (ppm)

m_low =  0;                             % zone air mass bounds (kg/s)
m_up  =  0.5;

T_low =  24;
T_up  =  26;
Tc    =  15;                           % zone air flow temp.

To    =  [29  28.5 28 28 28 28 28  28 28 28 28 27.5 27 27 27 27.5 28 28.5 29 29.5 30 30.5 31 31.5 32 32 32 32.5 33 33 33 33 33 32.5 32 32 32 31.5 31 30.5 30 30 30 29.5 29 29 29 29];  %outdoor air temperature
To    =  [To, To];

m_sum_up     =   8;                    % total zone air mass bounds (kg/s)
Price        =   zeros( 1, T );           % electricity price (time-of-use price)

Price(1:12)  =   0.4;     
Price(13:20) =   0.7;
Price(21:30) =   1.4;
Price(31:36) =   0.8;
Price(37:42) =   1.4;
Price(43:46) =   0.8;
Price(47:48) =   0.4;
Price        =   [Price, Price];





