%function DiaplayResult

clear all;
clc;

load all48.mat;

figure(1); hold on; box on; set(gcf, 'position', [200, 200, 600, 300]);
set(gca, 'fontsize', 14, 'FontName', 'Times');
axis([0, 48, 22, 29]);
plot( 1:T, Ti_f(3, 1:T), 'linewidth', 1.5 );
xlabel('Time [h]');
ylabel('Temperature [C]')



figure(2); hold on; box on; set(gcf, 'position', [900, 200, 600, 300]);
set(gca, 'fontsize', 14, 'FontName', 'Times');
axis([0, 48, 400, 800]);
plot( 1:T, CO2(3, 1:T), 'linewidth', 1.5 );
xlabel('Time [h]');
ylabel('CO2 [ppm]');

figure(3); hold on; box on; set(gcf, 'position', [200, 600, 600, 300]);
set(gca, 'fontsize', 14, 'FontName', 'Times');
axis([0, 48, 0, 1]);
stairs( 1:T, dr(1:T), 'linewidth', 1.5 );
xlabel('Time [h]');
ylabel('dr')