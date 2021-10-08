%function ShowResult
clear all
clc;

load all0320.mat;


figure(1);
hold on;
box on;
z1=stairs(Na(3,1:T), '-rs');
set(z1, 'linewidth', 1.5);

 z2=stairs(Na(4,1:T), '-bo');
 set(z2, 'linewidth', 1.5);
 
 
% z3=stairs(Na(5,1:T), '-b^');
 %set(z3, 'linewidth', 1.5);


z4=stairs(Na(6,1:T), '-k*');
set(z4, 'linewidth', 1.5);



set(gca, 'XTick', 0:4:48);
set(gca, 'XTickLabel', {'0', '2', '4', '6', '8', '10', '12', '14', '16', '18', '20', '22', '24'});

xlabel('Time (h)');
ylabel('#Occupants')
legend('Zone 3', 'Zone 4', 'Zone 6')



figure(2);
hold on;
box on

z1=plot(Ti0(3,1:T), '-rs');
set(z1, 'linewidth', 1.5);

 z2=plot(Ti0(4,1:T), '-bo');
 set(z2, 'linewidth', 1.5);
 
 
% z3=plot(Na(5,1:T), '-b^');
 %set(z3, 'linewidth', 1.5);


z4=plot(Ti0(6,1:T), '-k*');
set(z4, 'linewidth', 1.5);



set(gca, 'XTick', 0:4:48);
set(gca, 'XTickLabel', {'0', '2', '4', '6', '8', '10', '12', '14', '16', '18', '20', '22', '24'});

xlabel('Time (h)');
ylabel('Zone Temperature (°C)')
legend('Zone 3', 'Zone 4', 'Zone 6')




figure(3);
hold on;
box on

z1=plot(mz0(3,1:T), '-rs');
set(z1, 'linewidth', 1.5);

 z2=plot(mz0(4,1:T), '-bo');
 set(z2, 'linewidth', 1.5);
 
 
% z3=plot(Na(5,1:T), '-b^');
 %set(z3, 'linewidth', 1.5);


z4=plot(mz0(6,1:T), '-k*');
set(z4, 'linewidth', 1.5);



set(gca, 'XTick', 0:4:48);
set(gca, 'XTickLabel', {'0', '2', '4', '6', '8', '10', '12', '14', '16', '18', '20', '22', '24'});

xlabel('Time (h)');
ylabel('Zone Air Flow Rate (kg/s)')
legend('Zone 3', 'Zone 4', 'Zone 6')
axis([0, 48, 0, 0.5])




figure(4);
hold on;
box on

z1=plot(CO2(3,1:T), '-rs');
set(z1, 'linewidth', 1.5);

 z2=plot(CO2(4,1:T), '-bo');
 set(z2, 'linewidth', 1.5);
 
 
% z3=plot(Na(5,1:T), '-b^');
 %set(z3, 'linewidth', 1.5);


z4=plot(CO2(6,1:T), '-k*');
set(z4, 'linewidth', 1.5);



set(gca, 'XTick', 0:4:48);
set(gca, 'XTickLabel', {'0', '2', '4', '6', '8', '10', '12', '14', '16', '18', '20', '22', '24'});

xlabel('Time (h)');
ylabel('Zone CO2 (ppm)')
legend('Zone 3', 'Zone 4', 'Zone 6')



figure(5);
hold on;
box on

z=stairs(dr(1:T), '-b^');
set(z, 'linewidth', 1.5);

set(gca, 'XTick', 0:4:48);
set(gca, 'XTickLabel', {'0', '2', '4', '6', '8', '10', '12', '14', '16', '18', '20', '22', '24'});

xlabel('Time (h)');
ylabel('d_r')


% subplot(2,1,2)
% hold on;
% box on;
%
% title('(b)');
%
%  z2=plot(Ti0_temp(2, 1:T), '-ko');
%  set(z2, 'linewidth', 1.5);
%
% z2=plot(Ti0(2, 1:T), '-bo');
% set(z2, 'linewidth', 1.5);
%
%
% set(gca, 'XTick', 0:4:48);
% set(gca, 'XTickLabel', {'0', '2', '4', '6', '8', '10', '12', '14', '16', '18', '20', '22', '24'});
%
% set(gca, 'YTick',  23:1:28)
% %set(gca, 'YTickLabel',  {'22', '23', '24', '25', '26', '27', '28'});
% axis([0 48 23 28])
%   legend( 'Temp', 'Temp+CO2');
% xlabel('Time (h)');
% ylabel('Temperature (^oC)')
%
%
%
% % figure(2);
% % hold on;
% % box on;
% %
% % z1=stairs(Na(1,1:T), '-rs');
% % set(z1, 'linewidth', 1.5);
% %
% % z2=stairs(Na(2, 1:T), '-bo');
% % set(z2, 'linewidth', 1.5);
% %
% % set(gca, 'XTick', 0:4:48);
% % set(gca, 'XTickLabel', {'0', '2', '4', '6', '8', '10', '12', '14', '16', '18', '20', '22', '24'});
% %
% % set(gca, 'YTick',  0:1:5)
% % %set(gca, 'YTickLabel',  {'22', '23', '24', '25', '26', '27', '28'});
% % axis([0 48 0 5])
% % legend('Zone 1', 'Zone 2');
% % xlabel('Time (h)');
% % ylabel('#Occupants')
% %
% % %CO2=ComputeCO2(Cg, Na, m, CO20, mz0, dr);
% %
% figure(3);
% hold on;
% box on;
%
% load CO2_temp.mat;
%
% z1=plot(CO2_temp(1,1:T), '-go');
% set(z1, 'linewidth', 1.5);
%
% z2=plot(CO2_temp(2, 1:T), '-ko');
% set(z2, 'linewidth', 1.5);
%
% z1=plot(CO2(1,1:T), '-rs');
% set(z1, 'linewidth', 1.5);
%
% z2=plot(CO2(2, 1:T), '-bs');
% set(z2, 'linewidth', 1.5);
%
% set(gca, 'XTick', 0:4:48);
% set(gca, 'XTickLabel', {'0', '2', '4', '6', '8', '10', '12', '14', '16', '18', '20', '22', '24'});
%
% %set(gca, 'YTick',  0:1:5)
% %set(gca, 'YTickLabel',  {'22', '23', '24', '25', '26', '27', '28'});
% axis([0 48 200 1000])
% legend('Zone 1-Temp', 'Zone 2-Temp', 'Zone 1-Temp+CO2', 'Zone 2-Temp+CO2');
% xlabel('Time (h)');
% ylabel('CO_2 (ppm)')
%
% %
% %
% figure(4);
% hold on;
% box on;
%
% z=stairs(dr(1:T), '-b^');
% set(z, 'linewidth', 1.5);
% set(gca, 'XTick', 0:4:48);
% set(gca, 'XTickLabel', {'0', '2', '4', '6', '8', '10', '12', '14', '16', '18', '20', '22', '24'});
% axis([0 48 0 1])
% xlabel('Time (h)');
% ylabel('d_r')
% %
% %
% %
% figure(5);
% hold on;
% box on;
%
% load mz_temp.mat;
%
% subplot(2,1,1);
% hold on;
% box on;
%
%  z1=plot(mz_temp(1,1:T), '-gs');
%  set(z1, 'linewidth', 1.5);
%
% z2=plot(mz0(1, 1:T), '-ro');
% set(z2, 'linewidth', 1.5);
% legend('Temp', 'Temp+CO2');
% set(gca, 'XTick', 0:4:48);
% set(gca, 'XTickLabel', {'0', '2', '4', '6', '8', '10', '12', '14', '16', '18', '20', '22', '24'});
% axis([0, 48, 0, 0.5]);
% set(gca, 'YTick', 0:0.1:0.5);
% ylabel('Zone Air Flow Rate (kg/s)');
% title('(a)');
%
%
% subplot(2,1,2);
% hold on;
% box on;
%
% z1=plot(mz_temp(2,1:T), '-ks');
%  set(z1, 'linewidth', 1.5);
% %
% z2=plot(mz0(2, 1:T), '-bo');
% set(z2, 'linewidth', 1.5);
%
% set(gca, 'XTick', 0:4:48);
% set(gca, 'XTickLabel', {'0', '2', '4', '6', '8', '10', '12', '14', '16', '18', '20', '22', '24'});
% axis([0, 48, 0, 0.5]);
% set(gca, 'YTick', 0:0.1:0.5);
% ylabel('Zone Air Flow Rate (kg/s)');
% %legend('Zone 1', 'Zone 2');
% legend('Temp', 'CO2+Temp');
% %title('Zone 2')
% xlabel('Time (h)')
% title('(b)');
% %
% %
% %
% figure(6);
% hold on;
% box on;
%
% subplot(2, 1,2);
% z1=plot(m_low_bound(2, 1:T), '-rs');
% set(z1, 'linewidth', 1.5);
% ylabel('Air Flow Rate (kg/s)')
% set(gca, 'YTick', 0:0.1:0.5);
% axis([0 48 0 0.5]);
% set(gca, 'XTick', 0:4:48);
% set(gca, 'XTickLabel', {'0', '2', '4', '6', '8', '10', '12', '14', '16', '18', '20', '22', '24'});
% xlabel('Time (h)')
% %
% %
% subplot(2,1,1);
% title('Zone 2');
% z=stairs(Na(2,1:T), '-go');
% set(z, 'linewidth', 1.5);
% axis([0 48 0 5]);
% set(gca, 'YTick', 0:1:5);
% ylabel('#Occupants');
% set(gca, 'XTick', 0:4:48);
% set(gca, 'XTickLabel', {'0', '2', '4', '6', '8', '10', '12', '14', '16', '18', '20', '22', '24'});
% % z2=plot(m_low_bound(2, 1:T), '-bo');
% % set(z2, 'linewidth', 1.5);
% %
% %
% %
%
% %
% figure(7);
% hold on;
% box on;
%
% z1=plot(m_low_bound(2, 1:T), '-rs');
% set(z1, 'linewidth', 1.5);
%
% z2=plot(mz0(2, 1:T), '-bo');
% set(z2, 'linewidth', 1.5);
% ylabel('Min Air Flow Rate (kg/s)')
% set(gca, 'YTick', 0:0.1:0.5);
% axis([0 48 0 0.5]);
% set(gca, 'XTick', 0:4:48);
% set(gca, 'XTickLabel', {'0', '2', '4', '6', '8', '10', '12', '14', '16', '18', '20', '22', '24'});
% xlabel('Time (h)')
%
