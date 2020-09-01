n = 0:1:2500;
xn = cos((2*pi*n.*n)/(10000));
xk = fft(xn);
mrxk = abs(xk);
w =(2*pi*n)./2501;
plot(w,mrxk);
xlabel('Normalized frequency [rad/s]');
ylabel('Magnitude');
axis([0 2*pi 0 max(abs(xk))])
