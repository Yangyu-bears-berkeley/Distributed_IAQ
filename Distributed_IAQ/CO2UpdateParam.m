function [Ac, bc, Bc, Bc0, dc]=Step1UpdateParam(Fi, Gi, Cz, m, t)
N=20;
H=10;                    %planning horizon
Delta=30*60;        %decision interval
m_sum_up=8;


Ei=zeros(N,H);
for i=1:N
    for tau=1:H
        Ei(i,tau)=Cz(tau)*Delta/m(i);
    end
end


Ac=cell(N,1);
bc=cell(N,1);
for i=1:N
    Ac{i,1}=zeros(H-1,  3*H);
    bc{i,1}=zeros(H-1, 1);
end

for i=1:N
    for tau=1:H-1
        A1=[1, Ei(i, tau), Fi(i), -1,   0,   0];
        Ac{i,1}(tau, (tau-1)*3+1: tau*3+3)=A1;
        bc{i,1}(tau)=-Gi(i, t+tau-1);
    end
end


Bc0=zeros(H, 3*H);
for tau=1:H
    A1=[-1   0    0];
    Bc0(tau, 3*(tau-1)+1: 3*tau)=A1;
end

Bc=cell(N,1);
for i=1:N
    Bc{i,1}=zeros(H, 3*H);
end
dc=zeros(H,1);
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