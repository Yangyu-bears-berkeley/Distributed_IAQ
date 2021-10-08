function  Cz_New=UpdateCz(CO20, mzi, CO2i, t, Dr)
Co=400;
H=10;                         %planning horizon
Cz_New=zeros(1,H);


for tau=1:H
%     if t==1
%         Cz_New(tau)=Co;
%     elseif tau==1
%         if sum(mzi(:,tau))>0
%             Cz_New(tau)=(1-dr)*Co+dr*sum(mzi(:, tau).*CO20(:,t-1))/sum(mzi(:,tau));
%         else
%             Cz_New(tau)=Co;
%         end
%     else
        if sum(mzi(:,tau))>0
            Cz_New(tau)=(1-Dr(tau))*Co+Dr(tau)*sum(mzi(:, tau).*CO2i(:,tau))/sum(mzi(:,tau));  
        else
            Cz_New(tau)=Co;
        end
%     end
end
end