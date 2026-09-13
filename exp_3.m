clc;
clear;
close all;

%% Given parameters
A1 = 1;
A2 = 0.5;
R1 = 0.5;
R2 = 2/3;

%% Define Laplace variable
s = tf('s');

%% Transfer function matrix
% Dynamic equations:
%
% A1*dh1/dt = u1 - (h1-h2)/R1
% A2*dh2/dt = u2 + (h1-h2)/R1 - h2/R2

M = [A1*s + 1/R1,             -1/R1;
     -1/R1,        A2*s + 1/R1 + 1/R2];

%% MATLAB calculates the complete transfer matrix
G = minreal(inv(M));

%% Extract individual transfer functions
G11 = G(1,1);
G12 = G(1,2);
G21 = G(2,1);
G22 = G(2,2);

%% Display results
disp('--------------------------------------');
disp('TRANSFER FUNCTIONS');
disp('--------------------------------------');

disp('G11(s) = H1(s)/U1(s)');
G11

disp('G12(s) = H1(s)/U2(s)');
G12

disp('G21(s) = H2(s)/U1(s)');
G21

disp('G22(s) = H2(s)/U2(s)');
G22

disp('Complete Transfer Matrix G(s):');
G