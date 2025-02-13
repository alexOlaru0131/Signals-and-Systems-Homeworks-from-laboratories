%%
clc
clear all
close all

load train;
figure, plot([0:length(y)-1]/Fs, y), xlabel('t'), ylabel('x(t)'), title('Semnalul sonor')
dur_cadre = (length(y) - 1)/20;
nr_cadru = 1;

for i = dur_cadre: dur_cadre: length(y)

    N = i;

    % corectare lungime in cazul in care trece peste lungimea lui y
    if N > length(y)
        N = length(y);
        n = [N-dur_cadre+1:N];
    else
        n = [N-dur_cadre:N-1];
    end
    
    n = round(n);
    n(n < 1) = 1;
    n(n > length(y)) = length(y);

    x = y(n)';
    cadru = sprintf('Cadrul %d', nr_cadru);
    figure, subplot(311), t = [N-dur_cadre:N-1]/Fs; plot(t,x), ylabel('Semnal sonor'), title(cadru)
    subplot(312), Ak = fft(x); plot(abs(Ak)/dur_cadre), ylabel('Obtinerea cu fft'), hold on;

    n_armonice = 24;
    k = 1:1:n_armonice;
    CGS = sum(k.*abs(Ak(k)))/sum(abs(Ak(k)));
    afisare_CGS = sprintf('Centrul de greutate spectrala pentru cadrul %d este: %.5f', nr_cadru, CGS);
    disp(afisare_CGS)

    log_Ak = 20 * log10(abs(Ak));
    IRR_sum = 0;
    for k = 2:n_armonice-1
        IRR_sum = IRR_sum + abs(log_Ak(k) - (log_Ak(k+1) + log_Ak(k) + log_Ak(k-1))/3);
    end
    IRR = log10(IRR_sum);
    afisare_IRR = sprintf('Gradul de neregularitate al spectrului pentru cadrul %d este: %.5f\n', nr_cadru, IRR);
    disp(afisare_IRR)

    Ak_trapez = [];
    % estimarea perioadei fundamentale
    T0 = 0.1;
    w0 = 2*pi/T0;
    for k = N-dur_cadre:N-1
        Ak_trapez = [Ak_trapez, (1/T0)*trapz(t,x.*exp(-j*k*w0*t))];
    end
    subplot(312), plot(abs(Ak_trapez)), ylabel('Obtinerea cu metoda trapezelor'), plot(CGS,abs(Ak(round(CGS)))/dur_cadre,'x'), legend('Ak cu fft','Ak cu metoda trapezelor','CGS')
    subplot(313), stem(abs(unwrap(angle(Ak(1:end))))), ylabel('Spectrul faza al semnalului')

    nr_cadru = nr_cadru + 1;
end

%%