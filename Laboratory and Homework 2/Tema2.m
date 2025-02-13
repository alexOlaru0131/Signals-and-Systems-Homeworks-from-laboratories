clc
clear all
close all

%% ex 1
% a
t = -15:0.1:15;
for i =1:length(t)

    if(t(i) < 0 && t(i) >= -4) x1(i) = -t(i) - 2;
    else x1(i) = 0;
    end

    if( t(i) >= 0 && t(i) <= 4) x1(i) = -t(i) + 2;
    end

end

n = -15:1:15;
for i = 1:length(n)

    if(n(i) >= -4 && n(i) <= 0)x2(i) = n(i)/2 + 1;
    else x2(i) = 0;
    end

    if(n(i) <= 4 && n(i) > 0)x2(i) = -n(i)/2 + 1;
    end

end


%b
figure(1)
subplot(2,2,1)
plot(t-1,x1);grid on;
xlabel('t'); ylabel('x1(t-1)');
subplot(2,2,2)
plot(t+1,x1);grid on;
xlabel('t'); ylabel('x1(t+1)');
subplot(2,2,3)
plot(2*t,x1);grid on;
xlabel('t'); ylabel('x1(2t)');
subplot(2,2,4)
plot(t/2,x1);grid on;
xlabel('t'); ylabel('x1(t/2)');

figure(2)
subplot(2,2,1)
stem(n-1,x2);grid on;
xlabel('n'); ylabel('x2[n-1]');
subplot(2,2,2)
stem(n+1,x2);grid on;
xlabel('n'); ylabel('x2[n+1]');
subplot(2,2,3)
stem(2*n,x2);grid on;
xlabel('n'); ylabel('x2[2n]');
subplot(2,2,4)
stem(n/2,x2);grid on;
xlabel('n'); ylabel('x2[n/2]');



%% ex 2
% a

figure(3);

n = 0:1:40;

x = 4 * cos(pi .* n);

subplot(3,2,1);
stem(n,x); grid on;
xlabel('n'); ylabel('x[n] = 4cos(\pin)'); title('2.a');

% b

x = 2 * sin(3 .* n);
subplot(3,2,2);
stem(n,x); grid on;
xlabel('n'); ylabel('x[n] = 2sin(3n)'); title('2.b');

% c

x = 0.9 .^ n .* cos ((pi .* n)/10);
subplot(3,2,3);
stem(n,x); grid on;
xlabel('n'); ylabel('x[n] = 0.9^ncos(\pin/10)'); title('2.c');

% d

t = 0:1:40;
x = 4 * sin (5 * pi * t - pi / 4);
subplot(3,2,4);
plot(t,x); grid on;
xlabel('t'); ylabel('x(t) = 4sin(5\pit-\pi/4)'); title('2.d');

% e

x = cos(4*t) + 2*sin(8*t);
subplot(3,2,5);
plot(t,x); grid on;
xlabel('t'); ylabel('x(t) = cos(4*t)+2*sin(8*t)'); title('2.e');

% f

x = 3*cos(4*t) + sin(pi*t);
subplot(3,2,6);
plot(t,x); grid on;
xlabel('t'); ylabel('x(t) = 3*cos(4*t) + sin(\pi*t)'); title('2.f');