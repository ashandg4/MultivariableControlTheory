clc;
clear;
close all;

%% Two-Tank Liquid Level System

% Given specifications
A1 = 1;
A2 = 0.5;
R1 = 0.5;
R2 = 2/3;

%% Define Laplace variable
s = tf('s');

%% Transfer Functions

% H1(s) / U1(s)
G11 = 1 / (A1*R1*s + 1);

% H1(s) / U2(s)
G12 = 0;

% H2(s) / U1(s)
G21 = 1 / (R1*(A1*R1*s + 1)*(A2*R2*s + 1));

% H2(s) / U2(s)
G22 = R2 / (A2*R2*s + 1);

%% Transfer Matrix

G = [G11 G12;
     G21 G22];

%% Display Results

disp('-----------------------------------------');
disp('Two-Tank Liquid System Transfer Matrix');
disp('-----------------------------------------');

disp('A1 = ');
disp(A1);

disp('A2 = ');
disp(A2);

disp('R1 = ');
disp(R1);

disp('R2 = ');
disp(R2);

disp('Transfer Matrix G(s) = ');
G

%% Display Individual Transfer Functions

disp('G11(s) = H1(s)/U1(s)');
G11

disp('G12(s) = H1(s)/U2(s)');
G12

disp('G21(s) = H2(s)/U1(s)');
G21

disp('G22(s) = H2(s)/U2(s)');
G22

%% Step Response of the MIMO System

figure;
step(G);
grid on;
title('Step Response of Two-Tank Liquid Level System');

%% Poles of the System

disp('Poles of the system:');
pole(G)clc;
clear;
close all;

disp('Experiment 2: Transfer Matrix (Interacting)');

% State-space matrices
A = [-2  2;
      4 -7];

B = [1 0;
     0 2];

C = [1 0;
     0 1];

D = [0 0;
     0 0];

% Create state-space model
sys = ss(A,B,C,D);

% Convert state-space model to transfer function
G = tf(sys);

disp('Transfer Matrix G(s) = ');
G