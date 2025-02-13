clc
clear all
close all

%% reprezentarea semnalelor unidimensionale

x = -pi:0.02*pi:pi;
figure(1);
plot(x, max(sin(x),cos(x)), 'c', 'LineWidth',5); hold on
plot(x, sin(x), '--b',x,cos(x),'-.r','LineWidth',3); grid
axis([-pi, pi, -1.1, 1.1]), set(gca,'FontSize',12);

a = 1; b = .1;
t = 0:0.01:8 * pi;
x = a * exp(b * t) .* cos(t);
y = a * exp(b * t) .* sin(t);
figure(2);
plot(x,y,'r','LineWidth',2), box on
set(gca , 'FontSize', 16, 'FontWeight', 'Bold','XColor', [ 0 0 1], 'YColor', [ 0 0 1], 'XTick', [-5 0 5 10], 'YTick', [-10 -5 0 5]);
title('\fontsize{20}\color{blue}(ae^{bt}cos(t) ae^{bt}sin(t)', 'EdgeColor','b','LineWidth',2);

%% semnale elementare continue

%semnal treapta u(t) = (t >= 0 ) ? 1 : 0
t1 = -2 ; t2 = 6 ; tstep = 0.001;
t = t1:tstep:t2;
x = (t >= 0);
figure(3);
subplot(3,2,1);
plot(t,x);
xlabel('t'); ylabel('u(t)'); title('Semnal treapta unitara (plot)');
axis ([t1 - tstep, t2 + tstep, -0.1, 1.1 ]);

x = @(t) (t>= 0);
t = [t1, t2];
subplot(3,2,2);
fplot(x,t);
xlabel('t'); ylabel('u(t)');
axis([t -0.1 1.1]);
title('Semnal treapta unitara (fplot)');

%semnal impuls p(t) = ((t >= 0)&&(t<e)) ? 1/e : 0
e = 1/100;
t1 = -1; t2 = 5; tstep = 0.005;
t= t1:tstep:t2;
x = (1/e) * ((t>0)&(t<=e));
subplot(3,2,3);
plot(t,x);
xlabel('t'); ylabel('p_\epsilon(t)');
title('Semnal impuls (plot), \epsilon= 1/100');

x = @(t) (1/e)* ((t>0)&(t<=e));
t = [ t1, t2];
subplot(3,2,4);
fplot(x,t,5000);
set(gca, 'FontSize',14);
xlabel('t'); ylabel('p_\epsilon(t)');
axis([t1 t2 -0.1 1.1/e]);
title('Semnal impuls (fplot), \epsilon = 1/100');

% semnal sinusoidal x(t) = Asin(2 pi t + phi);
A = 2;T = 1/10; phi = pi/3;
t1 = -0.1; tstep = 0.005; t2 = 0.2;
t = t1:tstep:t2;
xs = A * sin (2 * pi/T * t + phi);
subplot(3,2,5);
plot(t,xs,'LineWidth',2); grid;
xlabel('t');ylabel('x_s(t)');
title('x_s(t) = A sin(( 2 \pi /T) t + \phi) (plot)');

xs = @(t) (A * sin(2 * pi/T * t + phi));
t = [ t1, t2];
subplot(3,2,6);
fplot(xs,t); grid;
xlabel('t'); ylabel('x_s(t)');
title('x_s(t) = A sin(( 2 \pi /T) t + \phi) (fplot)');

%% semnale elementare discrete

figure(4);

%semnal sinusoidal discret

n1 = -5; n2 = 10;
n = n1:n2;
x = (n>=0);
subplot(2,2,1);
stem(n,x);
xlabel('n'); ylabel('u[n]');
title('Secventa treapta unitara');
axis([n1 n2 -0.1 1.1]);

x = @(n)(n>=0);
subplot(2,2,2);
stem(n, x(n));
xlabel('n'); ylabel('u[n]');
title('Secventa treapta unitara');

%semnal sinusoidal discret
A = 2; Ns= 10; phi = pi/3;
n1 = -5; n2= 10; n = n1:n2;
xs = A * sin (2 * pi * (1/Ns) * n + phi);
subplot(2,2,3);
stem(n,xs);
xlabel('n'); ylabel('x_s[n]');
title('x_s[n] = A sin(2\pi (1 / N_s) n + \phi');

xs = @(n) (A * sin ( 2 * pi * (1 / Ns) * n + phi));
subplot(2,2,4);
stem(n,xs(n));
xlabel('n'); ylabel('x_s[n]');
title('x_s[n] = A sin(2\pi (1 / N_s) n + \phi');

%% reprezentarea semnalelor bidimensionale

figure(5);
t = 0:0.01*pi:2*pi;
x = cos(2*pi*t) ; y =sin (2 * pi * t); z = t;
plot3(x,y,z,'LineWidth',2); grid; view(20,30);
xlabel('x'); ylabel('y'); zlabel('z');

[t,p]=meshgrid(0:.02*pi:3 * pi);
figure, surf(t,p,t/2.*sin(p)), xlabel('t'),ylabel('p'),title('t/2 sin(p)');
view(40,60);
