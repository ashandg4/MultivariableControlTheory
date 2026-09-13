clc;
clear;
close all;

%% Given parameters
A1 = 1;
A2 = 0.5;
R1 = 0.5;
R2 = 2;
R3 = 1;

%% State-space model

% State equation:
% A1*dx1/dt = u1 - x1/R1 - x1/R3 + x2/R1
% A2*dx2/dt = u2 + x1/R1 - x2/R1 - x2/R2

A = [-(1/R1 + 1/R3)/A1,    1/(R1*A1);
      1/(R1*A2),           -(1/R1 + 1/R2)/A2];

B = [1/A1, 0;
     0,    1/A2];

C = [1 0;
     0 1];

D = [0 0;
     0 0];

%% Create state-space system
sys = ss(A,B,C,D);

%% Convert state-space model to transfer function
G = tf(sys);

%% Display Transfer Function Matrix
disp('Transfer Function Matrix G(s) = ');
G

%% Extract individual transfer functions
G11 = G(1,1);
G12 = G(1,2);
G21 = G(2,1);
G22 = G(2,2);

disp('G11(s) = X1(s)/U1(s)');
G11

disp('G12(s) = X1(s)/U2(s)');
G12

disp('G21(s) = X2(s)/U1(s)');
G21

disp('G22(s) = X2(s)/U2(s)');
G22

%% Step Response of the complete system
figure;
step(sys);
grid on;
title('Step Response of Two-Tank System');

%% Step response of X1 due to U1
figure;
step(G11);
grid on;
title('X1(s) / U1(s)');

%% Step response of X1 due to U2
figure;
step(G12);
grid on;
title('X1(s) / U2(s)');

%% Step response of X2 due to U1
figure;
step(G21);
grid on;
title('X2(s) / U1(s)');

%% Step response of X2 due to U2
figure;
step(G22);
grid on;
title('X2(s) / U2(s)');

%% Poles of the system
disp('Poles of the system:');
pole(sys);