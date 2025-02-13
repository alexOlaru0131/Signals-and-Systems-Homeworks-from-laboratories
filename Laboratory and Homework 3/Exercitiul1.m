clc
clear all
close all

figure(1)
%% 1.a
x = @(t)(2*cos(pi*t-acos(-1/2)));
subplot(2,2,1);
fplot(x,[-3,3]);grid on; title('1.a');

%% 1.b
x = @(t)((t>=0) + sin(2*pi*t/3));
subplot(2,2,2);
fplot(x,[-6,6]); grid on; title('1.b');

%% 1.c
n = -5:5;
x = cos(pi*n);
subplot(2,2,3);
stem(n,x);grid on; title('1.c');

%% 1.d
t = 5:0.05:36;
x = 5 - mod(t,10);
subplot(2,2,4);
plot(t,x);grid on; title('1.d'); 

%% 2.a %% T = 2/5
figure(2)
x = @(t)(4 * cos(5*pi*t) - pi / 4);
subplot(3,3,1);
fplot(x,[-1 1]); grid on; xlabel("t = [-1 1]"); ylabel("x(t)=4cos(5\pit-\pi/4)"); title("2.a");

%% 2.b %% semnalul nu este periodic
x = @(t)((t>=0) + 2 * sin (3 * t));
subplot(3,3,2);
fplot(x,[-4 4]); grid on; xlabel("t = [-4 4]"); ylabel("x(t)=4u(t)+2sin(3t)"); title("2.b");

%% 2.c %% semnalul nu este periodic
x = @(t)(3 * cos(4 * t) + sin(pi * t));
subplot(3,3,3);
fplot(x,[-4 4]); grid on; xlabel("t = [-4 4]"); ylabel("x(t)=3cos(4t)+sin(\pit)"); title("2.c");

%% 2.d %% T = 2
x = @(t)(cos(2*pi*t) + 2 * cos(4*pi*t) + sin(pi * t));
subplot(3,3,4);
fplot(x,[-3 3]); grid on; xlabel("t = [-3 3]"); ylabel("x(t)=cos(2\pit)+2cos(4\pit)+sin(\pit)"); title("2.d");

%% 2.e %% T = 24
x = @(t)(4*cos(3*pi*t + pi/2) + 2*cos(8*pi*t + pi/2));
subplot(3,3,5);
fplot(x,[-2 2]); grid on; xlabel("t = [-2 2]"); ylabel("x(t)=4cos(3\pit+\pi/2)+2cos(8\pit+\pi/2)"); title("2.e");

%% 2.f %% T = 30
x = @(t)(4*cos(3*pi*t + pi/2) + 4*cos(10*pi*t - pi/2));
subplot(3,3,6);
fplot(x,[-1 1]); grid on; xlabel("t = [-1 1]"); ylabel("x(t)=4cos(3\pit+\pi/2)+2cos(10\pit-\pi/2)"); title("2.f");

%% 2.g %% N = 2
n = -2:0.1:2;
x = 4 * cos(pi * n - 2);
subplot(3,3,7);
stem(n,x); grid on; xlabel("n=-2:0.1:2"); ylabel("x[n]=4cos(\pin-2)"); title("2.g");

%% 2.h %% semnalul nu este periodic
n = -2:0.1:2;
x = 2 * sin(3*n);
subplot(3,3,8);
stem(n,x); grid on; xlabel("n=-2:0.1:2"); ylabel("x[n]=2sin(3n)"); title("2.h");

%% 2.i %% N = 4
n = -4:0.1:4;
x = 4 * cos(0.5*pi*n + pi/4);
subplot(3,3,9);
stem(n,x); grid on; xlabel("n=-4:0.1:4"); ylabel("x[n]=4cos(0.5\pin+\pi/4))"); title("2.i");

