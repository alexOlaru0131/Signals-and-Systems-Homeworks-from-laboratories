clc;
clear all;
close all;

figure(1);

%1
t = 0:0.1:10;

for i = 1:length(t)

    y(i) = 0.5 ^ t(i);

end

subplot(2,1,1);
plot(t,y);
grid on;
axis tight;
xlabel('Timp');
ylabel('Amplitudine');
title('Grafic exponentiala reala')

%2
t = 0:0.1:10;
y = 0.5 .^ t;

subplot(2,1,2);
plot(t,y);
grid on;
axis tight;
xlabel('Timp');
ylabel('Amplitudine');
title('Grafic exponentiala reala')