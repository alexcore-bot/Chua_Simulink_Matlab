clc;
clear variables;
close all;

%% Simulink options
opt         = simset(simget('SIMULINK_CHUA'),'RelTol',1E-6);
a = 15.6; 
b = 28;

%r0 = 0;%Ohm double-scroll
%r0 = 20;%Ohm Rossler;
%r0 = 30;%Ohm period 3 or 4
%r0 = 32; % Ohm period 2
r0 = 39;% Ohm period 1 or cycle limit
R = 1309;%1419;%Ohm
c2 = 1.00E-07; %F
L = 0.018;%mH

c = r0*R*c2/L; 

%% Numerical solution
%x0         = [1; 1; 1];
%x0 = [-1.00801; 0.15323; -0.00095]; 
x0 =          [0.7; 0; 0];
r1         = sim('SIMULINK_CHUA',100,opt); %color yellow
%x0         = [1; 1; 1 + 1E-12];
x0 =          [0.7; 0; 0+ 1E-12]; %color red
r2         = sim('SIMULINK_CHUA',100,opt);

%% Comparing states
subplot(3,1,1); plot(r1.tout,r1.x.signals.values(:,1),r2.tout,r2.x.signals.values(:,1));
xlabel('time'); ylabel('x(t)'); hold on;
subplot(3,1,2); plot(r1.tout,r1.x.signals.values(:,2),r2.tout,r2.x.signals.values(:,2));
xlabel('time'); ylabel('y(t)'); hold on;
subplot(3,1,3); plot(r1.tout,r1.x.signals.values(:,3),r2.tout,r2.x.signals.values(:,3));
xlabel('time'); ylabel('z(t)'); hold on;
%% Comparison
figure;
plot3(r1.x.signals.values(:,1),r1.x.signals.values(:,2),r1.x.signals.values(:,3),'y-');
xlabel('x(t)'); ylabel('y(t)'); zlabel('z(t)'); hold on;
plot3(r2.x.signals.values(:,1),r2.x.signals.values(:,2),r2.x.signals.values(:,3),'r-');
view(-72,36);
set(gca,'fontsize',12);

% Colors
set(gca,'Color',[0,0,0]);
set(gca,'GridColor',[1,1,1]);
set(gca,'Box','off');
set(gca,'GridAlpha',0.5);
grid on;