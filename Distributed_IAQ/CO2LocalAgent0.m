function  J0=Step1LocalAgent0(X0, Bc, Bc0, dc, Alpha, Beta, rou, X)

    %function Step1LocalAgent0 here
    
J0=0;
H=10;   %planning horizon
% Delta=30*60;
% kf=0.08;
N=20;       %the number of agents

As1=zeros(H, 3*H);
As2=zeros(H, 3*H);
for tau=1:H
    As1(tau,  3*(tau-1)+2)=1;
    As2(tau, 3*(tau-1)+3)=1;
end
s1=As1*X0;
s2=As2*X0;

% for tau=1:H
%     J0=J0+Price(t+tau-1)*kf*X0(3*(tau-1)+1)^2*Delta/3600;
% end

J0=J0+Alpha'*s1;

temp1=s1-dc;
for j=1:N
    temp1=temp1+Bc{j,1}*X(:,j);
end

J0=J0+rou/2*norm(temp1, 2)^2;


J0=J0+Beta'*(Bc0*X0+s2);
temp2=Bc0*X0+s2;
for j=1:N
    temp2=temp2+Bc{j,1}*X(:,j);
end
J0=J0+rou/2*norm(temp2, 2)^2;



end