clear, close all
ax(1) = -44.2, 	ax(2) = 0.6, 	ax(3) = 0.7, 	ax(4) = -0.4, 	ax(5) = -4.8, 	ax(6) = -0.01, 	ax(7) = -3.7, 
bx(1) = 1.2, 	bx(2) = 0.1, 	bx(3) = -0.03, 	bx(4) = -0.2, 	bx(5) = 0.5, 	bx(6) = 0.1, 	bx(7) = 0.9, 
ay(1) = -1.2, 	ay(2) = -0.1, 	ay(3) = 0.1, 	ay(4) = 0.2, 	ay(5) = 0.6, 	ay(6) = -0.3, 	ay(7) = -0.6,
by(1) = -43.8, 	by(2) = 0.8, 	by(3) = 0.1, 	by(4) = 0.4, 	by(5) = 3.7, 	by(6) = -0.6, 	by(7) = -3.6,
ax0 =  141.6, ay0 = 121.3, 

m = 327;
nc = 7;
T = m; w = 2*pi/T;
for n = 1:m
    X2(n) = ax0/2;
    Y2(n) = ay0/2;
    for k = 1:nc
        X2(n) = X2(n) + ax(k)*cos(k*w*n)+bx(k)*sin(k*w*n);
        Y2(n) = Y2(n) + ay(k)*cos(k*w*n)+by(k)*sin(k*w*n);
    end
end
c2 = [X2; Y2];
figure; plot(c2(1,:),c2(2,:)); hold on; plot(ax0/2,ay0/2,'*'); title('Conturul reconstruit pe baza FD')
