clc;
clear;
close all;

%% Parameters
A1 = 1;
A2 = 1/2;

R1 = 1/2;
R2 = 2;
R3 = 1;

%% Controller Gains
K1 = 1;
K2 = 1;

%% Reference Inputs
r1 = 1;
r2 = 1;

%% State-Space Matrices

A = [-(3+K1)      2;
          4    -(5+2*K2)];

B = [K1       0;
      0     2*K2];

C = [1 0;
     0 1];

D = [0 0;
     0 0];

%% Create State-Space System
sys = ss(A,B,C,D);

%% Simulation Time
t = 0:0.01:10;

%% Input Signals
u1 = r1 * ones(size(t));
u2 = r2 * ones(size(t));

% Combine the two inputs
U = [u1' u2'];

%% Initial Conditions
x0 = [0; 0];

%% Simulate using lsim
[y,t,x] = lsim(sys,U,t,x0);

%% Extract Tank Levels
C1 = y(:,1);
C2 = y(:,2);

%% Plot Response
figure;

plot(t,C1,'LineWidth',1.5);
hold on;

plot(t,C2,'LineWidth',1.5);

grid on;

xlabel('Time (s)');
ylabel('Tank Level');

legend('C_1','C_2');

title('Two-Tank System Response');

%% Display Final Values

fprintf('Final C1 = %.4f\n',C1(end));
fprintf('Final C2 = %.4f\n',C2(end));
