function [x] = suma(n)

x = 0;

for i = 0:1:n

    if( i == 0 ) x = x + 1;
    else x = x + 1/ factorial(i);
    end

end

mesaj = sprintf("Suma x(%d) este: %d\n",n,x);
fprintf(mesaj);

end