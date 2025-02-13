clc
clear all
close all

%% Exercitiul 1
% 1
figure(1)
u0 = @(t)(t>=0);
A = 2; t = -10:0.1:10;
i = -A * u0(t);
subplot(3,3,1);
plot(t,i,'LineWidth',2); grid; xlabel('t');

% 2
u0 = @(t)(t>=0);
A = 2; t = -10:0.1:10; T = 2;
i = -A * u0(t-T);
subplot(3,3,2);
plot(t,i,'LineWidth',2); grid; xlabel('t');

% 3
u0 = @(t)(t>=0);
A = 2; t = -10:0.1:10; T = 2;
i = -A * u0(t+T);
subplot(3,3,3);
plot(t,i,'LineWidth',2); grid; xlabel('t');

% 4
u0 = @(t)(t>=0);
A = 2; t = -10:0.1:10;
i = A * u0(-t);
subplot(3,3,4);
plot(t,i,'LineWidth',2); grid; xlabel('t');

% 5
u0 = @(t)(t>=0);
A = 2; t = -10:0.1:10; T = 2; xlabel('t');
i = A * u0(-t+T);
subplot(3,3,5);
plot(t,i,'LineWidth',2); grid; xlabel('t');

% 6
u0 = @(t)(t>=0);
A = 2; t = -10:0.1:10; T = 2;
i = A * u0(-t-T);
subplot(3,3,6);
plot(t,i,'LineWidth',2); grid;

% 7
u0 = @(t)(t>=0);
A = 2; t = -10:0.1:10;
i = -A * u0(-t);
subplot(3,3,7);
plot(t,i,'LineWidth',2); grid; xlabel('t');

% 8
u0 = @(t)(t>=0);
A = 2; t = -10:0.1:10; T = 2;
i = -A * u0(-t+T);
subplot(3,3,8);
plot(t,i,'LineWidth',2); grid; xlabel('t');

% 9
u0 = @(t)(t>=0);
A = 2; t = -10:0.1:10; T = 2;
i = -A * u0(-t-T);
subplot(3,3,9);
plot(t,i,'LineWidth',2); grid; xlabel('t');

%% Exercitiul 3
% semnalul
u0 = @(n)(n>=0);
n = -6:1:6;
x = @(n)(n/2 .* (u0(n+4) - u0(n-5)));
figure(3);
stem(n,x(n),'LineWidth',2); grid;
xlabel('n');ylabel('x[n]');

% a
figure(4);

subplot(3,3,1);
stem(n,x(2-n),'LineWidth',2); grid;
xlabel('n');ylabel('x[2-n]'); title('a)');

% b
subplot(3,3,2);
stem(n,x(n+2),'LineWidth',2); grid;
xlabel('n');ylabel('x[n+2]'); title('b)');

% c
subplot(3,3,3);
stem(n,u0(n) .* x(-n) + x(n),'LineWidth',2); grid;
xlabel('n');ylabel('x[-n]u[n]+x[n]'); title('c)');

% d
subplot(3,3,4);
stem(n,x(n+2) + x(-1-n),'LineWidth',2); grid;
xlabel('n');ylabel('x[n+2]+x[-1-n]'); title('d)');

% e
d = @(n)(n==0);

subplot(3,3,5);
stem(n,x(3*n).*d(n-1),'LineWidth',2); grid;
xlabel('n');ylabel('x[3n]\delta[n-1]'); title('e)');

% f
subplot(3,3,6);
stem(n,x(n+1).*(u0(n+3)-u0(-n)),'LineWidth',2); grid;
xlabel('n');ylabel('x[n+1](u[n+3]-u0[-n])'); title('f)');

% g
subplot(3,3,8);
stem(n,(u0(n-4)-u0(n-3)).*x(n),'LineWidth',2); grid;
xlabel('n');ylabel('(u[n-4]-u[n-3])x[n]'); title('g)');

