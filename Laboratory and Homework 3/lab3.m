clc
clear all
close all

figure
x = @(t)(4*cos(pi*t-acos(1/4)));
subplot(2,1,1);
fplot(x,[-2,3]); grid;
xlabel('t'); ylabel('x(t)');

t = -2:0.01:3;
x = 4*cos(pi*t+acos(1/4));
subplot(2,1,2);
plot(t,x); grid; xlabel('t'); ylabel('x(t)');

