function phix = aurocorr_2(x,N,M)
% a

    if(length(x) < M+N)
        phix = [];
        return
    end

    phix = zeros(1,N);
    for n = 1:N
        for k = 1+n:M + n
            phix(n) = phix(n) + x(k) * x(k-n);
        end
    end
    phix = phix / M;

end