clc;
clear all;
close all;

t = -2:0.1:2;

for i = 1:length(t)

    if(t(i) < 0) y(i) = -t(i) / 2;
        else y(i) = t(i) / 2;
    end

end

figure(1);
plot(t,y);
grid on;
axis tight;
