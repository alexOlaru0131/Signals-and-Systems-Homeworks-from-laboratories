clc
clear all
close all

%%
% generare semnal audio
Fs = 44100;
f_do = 261.6;
f_re = 293.6;
f_mi = 329.6;
t = 0:1/Fs : 0.5-1/Fs;
do = sin(2*pi*f_do*t);
re = sin(2*pi*f_re*t);
mi = sin(2*pi*f_mi*t);
silence = zeros(size(t));

t = 0:1/Fs:2.5-1/Fs;
s = [do,re,mi,silence,do];
figure, plot(t,s)
sound(s,Fs)
pause(3)

% adaugare zgomot 
z = 0.1*(2*rand(size(t))-1);
sz = s+z;
sound(sz,Fs);
pause(3);

% filtrare
M = 50;
h = 1/M * ones(1,M);
sf = conv(h,sz);
sound(s,Fs);

%%
% incarcarea semnalului in Matlab, afisarea grafica a semnalului, redarea
% semnalului audio
clc
clear all
close all

Fs = 44100;
load mtlb
y = mtlb; L = length(y); k=0:L-1; k=k'; t = k/Fs;
sound(y,Fs);
figure, plot(t,y)

% adaugare zgomot
noise = 0.5*sin(2*pi*1000/L*k);
y_z = y + noise;
sound(y_z, Fs);

%generarea unui filtru FIR trece banda
N = 100; Fpl = 100; Fph = 1000; Wbp = [Fpl Fph]./(Fs/2);
bpf = fir1(N, Wbp, 'bandpass');

outbpf = filter(bpf, 1, y_z);
sound(outbpf, Fs);

yo = conv(bpf,y_z);
sound(yo, Fs);

