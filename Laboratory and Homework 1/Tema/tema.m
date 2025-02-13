clc
clear all
close all

%% 1.b
t = -10:1:10;
y = zeros(size(t));

for i = 1:length(t)

    if((t(i) >= -10 & t(i) < -4) | (t(i) >= 4 & t(i) <= 10)) 
        y(i) = sin(t(i));
    elseif(t(i) >= -4 &  t(i) < 4)
        y(i) = abs(cos(2.*t(i)));
    end

end

%% 1.d
n = 1:1:100;
x = zeros(size(n));

for i = 1:length(n)

    x(i) = (1 + 1 ./ n(i)) .^ n(i);

end

%% afisarea
figure(1)
subplot(2,1,1);
plot(t,y);
grid on;
axis tight;
title('1.b');

subplot(2,1,2);
stem(n,x);
grid on;
axis tight;
title('1.d');

mesaj1 = sprintf("Factorialul lui %d este: %d\n",5,factorial(5));
fprintf(mesaj1);

suma(5);

mesaj2 = sprintf("Rezultatul calculului f(%d)/g(%d) este egal cu: %d\n",100,10,f(100)/g(10));
fprintf(mesaj2);

[x1,y1,z1] = sel(-1,2,3,5,-1,2,-4,-1,2,-6,9,0);
mesaj3 = sprintf("Solutia sistemului este: x = %d ; y = %d ; z = %d\n",x1,y1,z1);
fprintf(mesaj3);
