clc
clear all
close all

%% Exercitiul 1
% x1,x2,x3,x4,x5
t = -3:0.01:4;
u = @(t)(t>=0);
x1 = @(u,t)(u(t) - u(t-2));
x2 = @(u,t)(x1(u,t) + x1(u,t+1));
x3 = @(u,t)(x1(u,t-2) + x1(u,t+2));
x4 = @(u,t)(-3*x1(u,t+2));
x5 = @(u,t)(-x1(u,t));

figure(1)
subplot(3,2,1);
plot(t,x1(u,t),'LineWidth',2); grid; axis([-3 4 0 1]); xlabel('t'); ylabel('x1(t)');
subplot(3,2,2);
plot(t,x2(u,t),'LineWidth',2); grid; axis([-3 4 0 2]); xlabel('t'); ylabel('x2(t)');
subplot(3,2,3);
plot(t,x3(u,t),'LineWidth',2); grid; axis([-3 4 0 1]); xlabel('t'); ylabel('x3(t)');
subplot(3,2,4);
plot(t,x4(u,t),'LineWidth',2); grid; axis([-3 4 -3 0]); xlabel('t'); ylabel('x4(t)');
subplot(3,2,5);
plot(t,x5(u,t),'LineWidth',2); grid; axis([-3 4 -1 0]); xlabel('t'); ylabel('x5(t)');

% y1,y2,y3,y4,y5
y1 = @(u,t)(t.*x1(u,2*t) - (t-2).*x1(u,2*t-2));
y2 = @(u,t)(t.*x2(u,2*t) - (t-2).*x2(u,2*t-2));
y3 = @(u,t)(t.*x3(u,2*t) - (t-2).*x3(u,2*t-2));
y4 = @(u,t)(t.*x4(u,2*t) - (t-2).*x4(u,2*t-2));
y5 = @(u,t)(t.*x5(u,2*t) - (t-2).*x5(u,2*t-2));

figure(2)
subplot(3,2,1);
plot(t,y1(u,t),'LineWidth',2); grid; axis([-3 4 0 1]); xlabel('t'); ylabel('y1(t)');
subplot(3,2,2);
plot(t,y2(u,t),'LineWidth',2); grid; axis([-3 4 -0.5 2]); xlabel('t'); ylabel('y2(t)');
subplot(3,2,3);
plot(t,y3(u,t),'LineWidth',2); grid; axis([-3 4 -1 2]); xlabel('t'); ylabel('y3(t)');
subplot(3,2,4);
plot(t,y4(u,t),'LineWidth',2); grid; axis([-3 4 -6 3]); xlabel('t'); ylabel('y4(t)');
subplot(3,2,5);
plot(t,y5(u,t),'LineWidth',2); grid; axis([-3 4 -1 0]); xlabel('t'); ylabel('y5(t)');

%% Exercitiul 2
% a
% b
% c
% d

n = -5:1:5;
u = @(t)(t>=0);
x = @(u,n)(u(n) - u(n-3));

y_a = @(u,n)(2*x(u,n));
y_b = @(u,n)(x(u,n).*(2*n-1));
y_c = @(u,n)(x(u,n).*(-2+2*(-1).^n));

figure(3)
subplot(3,1,1);
stem(n,y_a(u,n),'LineWidth',2); grid; axis([-5 5 0 3]); xlabel('n'); ylabel('y(t)'); title('a');
subplot(3,1,2);
stem(n,y_b(u,n),'LineWidth',2); grid; axis([-5 5 -1 3]); xlabel('n'); ylabel('y(t)'); title('b');
subplot(3,1,3);
stem(n,y_c(u,n),'LineWidth',2); grid; axis([-5 5 -4 0]); xlabel('n'); ylabel('y(t)'); title('c');

%% Exercitiul 3
% a
% b
% c

n = 0:1:10;

u = @(t)(t==0);
x = @(u,n)(4*u(n));
y = zeros(size(n));

for i = 1:length(n)

    if mod(n(i),2) == 0
        y(i) = x(u,n(i))+1/2 * x(u,n(i)-1) + 1/4 * x(u,n(i)-2);
    else y(i) = 0;
    end

end

figure(4)
stem(n,y,'LineWidth',2); grid; axis([0 10 -1 4]); xlabel('n'); ylabel('y[n]');

%% Exercitiul 4

t = -5:0.01:5;
u = @(t)(t>=0);
x = @(u,t)(4*u(t) - 4*u(t-1));
y = @(u,t)((1-exp(-2*t)).*x(u,t));

figure(5)
plot(t,y(u,t),'LineWidth',2); grid; axis([-5 5 0 3.5]); xlabel('t'); ylabel('x(t)');

%% Exercitiul 5
