n = 0:1:1000;
yn = cos(pi*n/2);
wn_temp = ones(1,10);
wn = [wn_temp zeros(1, length(yn)-length(wn_temp))];
zn = yn.*wn;
w = -2*pi:0.01:2*pi;
Z = zn*exp(-j*n'*w);
%plot(w,Z);
%plot(w,abs(Z));
plot(w,angle(Z));