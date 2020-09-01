[x, Fs] = audioread(['code07_music.wav']);
N = 32;
n = 0:2*N-1;
g = zeros(2*N,32);
h = zeros(2*N,32);
for k = 1:32
    g(:,k) = (1/sqrt(N))*cos((pi/N)*(n + (N + 1)/2)*(k - 0.5));
    h(:,k) = flip(g(:,k));
end
v = fb_analysis(x,h);
y = fb_synthesis(v,g);
v2 = v.*v;
y2 = fb_synthesis(v2,g);

figure(1);
imagesc(abs(v));

figure(2);
subplot(1,2,1);
plot(x);
xlabel('n'); 
ylabel('x');
title('input signal');
subplot(1,2,2);
plot(y);
xlabel('n'); 
ylabel('y');
title('reconstructed signal');

figure(3);
subplot(1,2,1);
plot(x);
xlabel('n'); 
ylabel('x');
title('input signal');
subplot(1,2,2);
plot(y2);
xlabel('n'); 
ylabel('y');
title('reconstructed signal');