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
v_new = fb_analysis(v(:,1),h);
v0 = fb_synthesis(v_new,g);
v02 = v0.*v0;

for i = 2:32
v1(:,i) = delay(v(:,i),63);
end
v1(:,1) = v0;
y = fb_synthesis(v1,g);

for i = 2:32
v12(:,i) = delay(v(:,i),63);
end
v12(:,1) = v02;
y2 = fb_synthesis(v12,g);

figure(1);
imagesc(abs(v_new));

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
subplot(2,1,1);
plot(x);
xlabel('n'); 
ylabel('x');
title('input signal');
subplot(2,1,2);
plot(y2);
xlabel('n'); 
ylabel('y');
title('reconstructed signal');