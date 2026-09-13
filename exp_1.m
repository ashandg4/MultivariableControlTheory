clc;
clear;
close all;

A = [-1 1; 0 -2];

B = [0;1];

C = eye(2);
D = [0;0];

sys = ss(A,B,C,D);

t = 0:0.01:10;
u = ones(size(t));       % Unit-step input

x0 = [0; 0];             % Initial condition

[y,t,x] = lsim(sys,u,t,x0);

plot(t,x(:,1),'LineWidth',1.5);
hold on;
plot(t,x(:,2),'LineWidth',1.5);

grid on;
xlabel('Time (s)');
ylabel('States');
legend('x_1(t)','x_2(t)');
title('Response of the State-Space System');