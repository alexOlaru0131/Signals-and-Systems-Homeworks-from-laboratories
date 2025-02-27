clc
clear all
close all

%%
u=@(t)(t>=0);
x1 = @(u,t)((u(t)-u(t-1)).*t);
t = -1:0.01:3;
subplot(211); plot(t,x1(u,t)); axis([-1 2 -0.1 1.1]); grid; xlabel('t'); ylabel('x_1(t)');

y1 = @(u,t)(u(t)-u(t-1));
subplot(212); plot(t,y1(u,t)); axis([-1 2 -0.1 1.1]); grid; xlabel('t'); ylabel('y_1(t)');
x2 = x1(u,t) + x1(u,t-1); figure; subplot(211); plot(t,x2); axis([-1 3 -0.1 1.1]); grid; xlabel('t'); ylabel('x_2(t)');
y2 = y1(u,t) + y1(u,t-1); subplot(212); plot(t,y2); axis([-1 3 -0.1 1.1]); grid; xlabel('t'); ylabel('y_2(t)');

%%
