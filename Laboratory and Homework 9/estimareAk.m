function ak = estimareAk(x, t, T0, Ts, N)
%
t = t(1:floor(T0/Ts));
x = x(1:length(t));

% estimarea cu metoda trapezelor
w0 = 2*pi/T0;
ak = [];
for k = -N:N
    ak = [ak, (1/T0)*trapz(t, x.*exp(-j*k*w0*t))];
end

%
end