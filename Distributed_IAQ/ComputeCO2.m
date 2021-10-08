function   CO2=ComputeCO2(CO2, Cg, Na, m, mz0, dr, t)
T=48;  %the number of stages
N=20;     %the number of agents
Delta=30*60;

Co=400;
Cz=zeros(1,T);
%CO2=zeros(N,T);
%CO2(:,1)=CO20(:,1);

%for t=1:T
    for i=1:N
        if sum(mz0(:, t))>0 %& t>1
            Cz(t)=(1-dr(t))*Co+dr(t)*sum(mz0(:,t).*CO2(:, t))/sum(mz0(:, t));
        else
            Cz(t)=Co;
        end
        CO2(i,t+1)=CO2(i,t)+Delta*Na(i,t)*Cg/m(i)*10^6+Delta*(Cz(t)-CO2(i,t))/m(i)*mz0(i,t);
    end
%end

end