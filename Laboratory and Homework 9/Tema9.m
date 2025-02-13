%% 1
clc
clear all
close all

% d
N = 2;
u = @(t)(t>=0);
n = -N:1:N;
t = -3:0.01:3;

T = 1;
f = 1/T;
dc = 0.5;

x = @(t)((mod(t+T/4,T) < dc * T)); % daca (t+T/4)%T < dc * T => x = 1 altfel x = 0

plot(t,x(t),'LineWidth',2), axis([-3 3 0 1.2]), grid, legend('Semnal PWM');

%% 2
% a
clc
clear all
close all

% modificare exemplul 2
% generare semnal
T0 = 1; w0 = 2*pi/T0;

figure
N = 8;

Ts = 0.0005; t = -1:Ts:2;
x = t - 0.1 - round(t);
ak1 = estimareAk(x, t, T0, Ts, N)
subplot(311),plot(t,x,'LineWidth',2), grid, axis([-1 2 -0.6 0.4]);

Ts = 0.01; t = -1:Ts:2;
x = t - 0.1 - round(t);
ak2 = estimareAk(x, t, T0, Ts, N)
subplot(312),plot(t,x,'LineWidth',2), grid, axis([-1 2 -0.6 0.4]);

Ts = 0.001; t = -1:Ts:2;
x = t - 0.1 - round(t);
ak3 = estimareAk(x, t, T0, Ts, N)
subplot(313),plot(t,x,'LineWidth',2), grid, axis([-1 2 -0.6 0.4]);

%%
clc
clear all
close all

% modificare exemplul 3
% Ts = 0.0005;
T0 = 1; w0 = 2*pi/T0;
N = 8;
Ts = 0.0005; t = -1:Ts:2;
x = t - 0.1 - round(t);
ak = estimareAk(x, t, T0, Ts, N);

a0 = ak(N+1);
ksi0 = 0;
Ak = abs(ak(N+2:end));
ksi = angle(ak(N+2:end));

% sinteza semnal
x_est = a0 * ones(size(t));
for k = 1:N

    x_est = x_est + 2*Ak(k)*cos(w0 * k * t + ksi(k));

end
figure, plot(t, x, 'b', t, x_est, 'r'), xlabel('t'), legend('x(t)', 'x_{est}(t)'), title('Ts = 0.0005');

% afisare spectru
n0 = 0:N;
figure, subplot(311), stem(n0, [a0, Ak], '.'), legend('Amplitude spectrum');
subplot(312), stem(n0, [ksi0, ksi], '.g'), legend('Phase spectrum');
subplot(313), stem(n0, [a0^2, (Ak.^2)/2], '.r'), xlabel('n'), legend('Power spectrum');

% Ts = 0.01;
T0 = 1; w0 = 2*pi/T0;
N = 8;
Ts = 0.01; t = -1:Ts:2;
x = t - 0.1 - round(t);
ak = estimareAk(x, t, T0, Ts, N);

a0 = ak(N+1);
ksi0 = 0;
Ak = abs(ak(N+2:end));
ksi = angle(ak(N+2:end));

% sinteza semnal
x_est = a0 * ones(size(t));
for k = 1:N

    x_est = x_est + 2*Ak(k)*cos(w0 * k * t + ksi(k));

end
figure, plot(t, x, 'b', t, x_est, 'r'), xlabel('t'), legend('x(t)', 'x_{est}(t)'), title('Ts = 0.01');

% afisare spectru
n0 = 0:N;
figure, subplot(311), stem(n0, [a0, Ak], '.'), legend('Amplitude spectrum');
subplot(312), stem(n0, [ksi0, ksi], '.g'), legend('Phase spectrum');
subplot(313), stem(n0, [a0^2, (Ak.^2)/2], '.r'), xlabel('n'), legend('Power spectrum');

% Ts = 0.001;
T0 = 1; w0 = 2*pi/T0;
N = 8;
Ts = 0.001; t = -1:Ts:2;
x = t - 0.1 - round(t);
ak = estimareAk(x, t, T0, Ts, N);

a0 = ak(N+1);
ksi0 = 0;
Ak = abs(ak(N+2:end));
ksi = angle(ak(N+2:end));

% sinteza semnal
x_est = a0 * ones(size(t));
for k = 1:N

    x_est = x_est + 2*Ak(k)*cos(w0 * k * t + ksi(k));

end
figure, plot(t, x, 'b', t, x_est, 'r'), xlabel('t'), legend('x(t)', 'x_{est}(t)'), title('Ts = 0.001');

% afisare spectru
n0 = 0:N;
figure, subplot(311), stem(n0, [a0, Ak], '.'), legend('Amplitude spectrum');
subplot(312), stem(n0, [ksi0, ksi], '.g'), legend('Phase spectrum');
subplot(313), stem(n0, [a0^2, (Ak.^2)/2], '.r'), xlabel('n'), legend('Power spectrum');

%%
% b
clc
clear all
close all

% modificare exemplul 2
% generare semnal
T0 = 1; w0 = 2*pi/T0;

figure
N = 16;

Ts = 0.0005; t = -1:Ts:2;
x = t - 0.1 - round(t);
ak1 = estimareAk(x, t, T0, Ts, N)
subplot(311),plot(t,x,'LineWidth',2), grid, axis([-1 2 -0.6 0.4]);

Ts = 0.01; t = -1:Ts:2;
x = t - 0.1 - round(t);
ak2 = estimareAk(x, t, T0, Ts, N)
subplot(312),plot(t,x,'LineWidth',2), grid, axis([-1 2 -0.6 0.4]);

Ts = 0.001; t = -1:Ts:2;
x = t - 0.1 - round(t);
ak3 = estimareAk(x, t, T0, Ts, N)
subplot(313),plot(t,x,'LineWidth',2), grid, axis([-1 2 -0.6 0.4]);

%%
clc
clear all
close all

% modificare exemplul 3
% Ts = 0.0005;
T0 = 1; w0 = 2*pi/T0;
N = 16;
Ts = 0.0005; t1 = -1:Ts:2;
x = t1 - 0.1 - round(t1);
ak = estimareAk(x, t1, T0, Ts, N);

a0 = ak(N+1);
ksi0 = 0;
Ak = abs(ak(N+2:end));
ksi = angle(ak(N+2:end));

% sinteza semnal
x_est1 = a0 * ones(size(t1));
for k = 1:N

    x_est1 = x_est1 + 2*Ak(k)*cos(w0 * k * t1 + ksi(k));

end
figure, plot(t1, x, 'b', t1, x_est1, 'r'), xlabel('t'), legend('x(t)', 'x_{est}(t)'), title('Ts = 0.0005');

% afisare spectru
n0 = 0:N;
figure, subplot(311), stem(n0, [a0, Ak], '.'), legend('Amplitude spectrum');
subplot(312), stem(n0, [ksi0, ksi], '.g'), legend('Phase spectrum');
subplot(313), stem(n0, [a0^2, (Ak.^2)/2], '.r'), xlabel('n'), legend('Power spectrum');

% Ts = 0.01;
T0 = 1; w0 = 2*pi/T0;
N = 16;
Ts = 0.01; t2 = -1:Ts:2;
x = t2 - 0.1 - round(t2);
ak = estimareAk(x, t2, T0, Ts, N);

a0 = ak(N+1);
ksi0 = 0;
Ak = abs(ak(N+2:end));
ksi = angle(ak(N+2:end));

% sinteza semnal
x_est2 = a0 * ones(size(t2));
for k = 1:N

    x_est2 = x_est2 + 2*Ak(k)*cos(w0 * k * t2 + ksi(k));

end
figure, plot(t2, x, 'b', t2, x_est2, 'r'), xlabel('t'), legend('x(t)', 'x_{est}(t)'), title('Ts = 0.01');

% afisare spectru
n0 = 0:N;
figure, subplot(311), stem(n0, [a0, Ak], '.'), legend('Amplitude spectrum');
subplot(312), stem(n0, [ksi0, ksi], '.g'), legend('Phase spectrum');
subplot(313), stem(n0, [a0^2, (Ak.^2)/2], '.r'), xlabel('n'), legend('Power spectrum');

% Ts = 0.001;
T0 = 1; w0 = 2*pi/T0;
N = 16;
Ts = 0.001; t3 = -1:Ts:2;
x = t3 - 0.1 - round(t3);
ak = estimareAk(x, t3, T0, Ts, N);

a0 = ak(N+1);
ksi0 = 0;
Ak = abs(ak(N+2:end));
ksi = angle(ak(N+2:end));

% sinteza semnal
x_est3 = a0 * ones(size(t3));
for k = 1:N

    x_est3 = x_est3 + 2*Ak(k)*cos(w0 * k * t3 + ksi(k));

end
figure, plot(t3, x, 'b', t3, x_est3, 'r'), xlabel('t'), legend('x(t)', 'x_{est}(t)'), title('Ts = 0.001');

% afisare spectru
n0 = 0:N;
figure, subplot(311), stem(n0, [a0, Ak], '.'), legend('Amplitude spectrum');
subplot(312), stem(n0, [ksi0, ksi], '.g'), legend('Phase spectrum');
subplot(313), stem(n0, [a0^2, (Ak.^2)/2], '.r'), xlabel('n'), legend('Power spectrum');

%% afisare x_est
figure, subplot(211), plot(t1, x_est1,'LineWidth',3); hold on;
plot(t2, x_est2,'LineWidth',2); hold on;
plot(t3, x_est3);
legend('x_est1','x_est2','x_est3');

x_est = x_est1(1:length(x_est2)) + x_est2;
subplot(212), plot(t2,x_est);

%%