clc
clear all
close all

%% Exercitiul 1
u = @(n)(n>=0);
x = @(n)(u(n)-u(n-2));
y = @(n)(0.2.^n .* u(n));

sx = 0; ex = 20; dtx = sx:ex;
sy = 0; ey = 19; dty = sy:ey;
dtv = sx+sy : ex;
v = conv(x(dtx), y(dty));

figure(1)
subplot(311);
stem(dtx,x(dtx),'LineWidth',2); grid; axis([0 5 0 2]); xlabel('n'); ylabel('x[n]');
subplot(312)
stem(dtx,y(dtx),'LineWidth',2); grid; axis([0 5 0 2]); xlabel('n'); ylabel('y[n]');
subplot(313)
stem(dtv,v(1:length(dtv)),'LineWidth',2); grid; axis([0 5 0 2]); xlabel('n'); ylabel('v[n]');

%% Exercitiul 2
dir = @(n)(n==0);
x = @(n)(dir(n) + 2*dir(n-1) - dir(n-3));
h = @(n)(2*dir(n+1) + 2*dir(n-1));

sx = -2; ex = 4; dtx = sx:ex;
sh = -4; eh = 4; dth = sh:eh;

%
dty1 = sx+sh : ex;
y1 = conv(x(dtx),h(dth));

figure(2)
subplot(331);
stem(dtx,x(dtx),'LineWidth',2); grid; axis([-2 4 -1 2]); xlabel('n'); ylabel('x[n]');
subplot(332);
stem(dth,h(dth),'LineWidth',2); grid; axis([-4 2 0 2]); xlabel('n'); ylabel('h[n]');
subplot(333);
stem(dty1,y1(1:length(dty1)),'r','LineWidth',2); grid; axis([-4 4 -2 4]); xlabel('n'); ylabel('y1[n]');

%
dty2 = sx+sh : ex;
y2 = conv(x(dtx+1),h(dth));

subplot(334);
stem(dtx,x(dtx+1),'-b','LineWidth',2); grid; axis([-2 4 -1 2]); xlabel('n'); ylabel('x[n+1]');
subplot(335);
stem(dth,h(dth),'LineWidth',2); grid; axis([-4 2 0 2]); xlabel('n'); ylabel('h[n]');
subplot(336);
stem(dty2,y2(1:length(dty2)),'r','LineWidth',2); grid; axis([-4 4 -2 4]); xlabel('n'); ylabel('y2[n]');

%
dty3 = sx+sh : ex;
y3 = conv(x(dtx),h(dth+2));

subplot(337);
stem(dtx,x(dtx),'LineWidth',2); grid; axis([-2 4 -1 2]); xlabel('n'); ylabel('x[n]');
subplot(338);
stem(dth,h(dth+2),'-b','LineWidth',2); grid; axis([-4 2 0 2]); xlabel('n'); ylabel('h[n+2]');
subplot(339);
stem(dty3,y3(1:length(dty3)),'r','LineWidth',2); grid; axis([-4 4 -2 4]); xlabel('n'); ylabel('y3[n]');

%% Exercitiul 3
clc

alfa = pi/8;
u = @(n)(n>=0);
dir = @(n)(n==0);

h1 = @(n)(alfa.^n .* u(n));
h2 = @(n)(sin(8.*n));
x = @(n)(dir(n) - alfa .* dir(n-1));

sh1 = 0; eh1 = 20; dh1 = sh1:eh1;
sh2 = 0; eh2 = 20; dh2 = sh2:eh2;
sx = 0; ex = 20; dtx = sx:ex;

dh1x = sh1+sx : eh1;
h1x = conv(x(dtx+1),h1(dh1+1));

dh2x = sh1+sx+sh2 : eh1;
h2x = conv(h1x,h2(dh2+1));

figure(3)
subplot(311);
plot(dh1x,h1x(1:length(dh1x)),'LineWidth',2); axis([0 10 -0.15 0]); grid; xlabel('n'); ylabel('h1[n]');
subplot(312);
plot(dh2x,h2x(1:length(dh2x)),'LineWidth',2); axis([0 10 -0.2 0.2]); grid; xlabel('n'); ylabel('h2[n]');
subplot(313);
plot(dtx,x(1:length(dtx)),'LineWidth',2); axis([0 10 -0.4 0]); grid; xlabel('n'); ylabel('x[n]');
