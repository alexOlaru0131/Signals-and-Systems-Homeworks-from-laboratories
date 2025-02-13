clc
clear all
close all

%%
% b
N = 128;
M = 1000;
n = 0:N+M-1;
xp = 1*sin(2*pi*n/64);

% c
A = 1;
x = xp + A * rand(1,length(n));

% d
phixx = autocorr_2(x,N,M);

% e
figure(1)
A = 1;
x = xp + A * rand(1,length(n));
phixx = autocorr_2(x,N,M);
subplot(2,1,1);
stem(x(1:N)); grid; title("A zgomot = 1");
subplot(2,1,2);
stem(phixx); grid;

figure(2);
A = 2;
x = xp + A * rand(1,length(n));
phixx = autocorr_2(x,N,M);
subplot(2,1,1);
stem(x(1:N)); grid; title("A zgomot = 2");
subplot(2,1,2);
stem(phixx); grid;

figure(3)
A = 3;
x = xp + A * rand(1,length(n));
phixx = autocorr_2(x,N,M);
subplot(2,1,1);
stem(x(1:N)); grid; title("A zgomot = 3");
subplot(2,1,2);
stem(phixx); grid;
