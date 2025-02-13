clc
clear all
close all

%% exemplul 1

sx = -7; ex = 0;
sy = 0; ey = 7;
dtx = sx:ex;
dty = sy:ey;
dtw = sx+sy : ex+ey;
x = (-1).^dtx;
y = ones(1, ey-sy+1);
w = conv(x,y);

figure(1);
subplot(311); stem(dtx, x, 'LineWidth',2); xlabel('n'); ylabel('x[n]');
subplot(312); stem(dty, y, 'LineWidth',2); xlabel('n'); ylabel('y[n]');
subplot(313); stem(dtw, w, 'LineWidth',2); xlabel('n'); ylabel('w[n]');

%% exemplul 2

x = @(n)(n>=1);
v = @(n)((0.5).^(n-1).*(n>=0));
sx = 1; ex = 20; dtx = sx:ex;
sv = 0; ev = 19; dtv = sv:ev;
dty = sx+sv:ex;
y = conv(double(x(dtx)), v(dtv));

figure(2);
subplot(311); stem(dtx,x(dtx),'LineWidth',2); xlabel('n'); ylabel('x[n]');
subplot(312); stem(dtv,v(dtv),'LineWidth',2); xlabel('n'); ylabel('v[n]');
subplot(313); stem(dty, y(1:length(dty)), 'LineWidth',2); hold on;
y2 = (4 - ((0.5).^(dty-2)).*(dty>=1));
stem(dty, y2,'* r'); xlabel('n'); ylabel('y[n]');
legend('y','y2');
