N = 25000;
n = 0:1:N-1;
Fs = 10000;
W1 = 50;
W2 = 10;
M1 = floor(N/W1);
un1 = [ones(1,W1) zeros(1,N-W1)];
un2 = [ones(1,W2) zeros(1,N-W2)];
h1 = cos((pi/4)*n) + cos((pi/2)*n);
h2 = cos((pi/2)*n) + cos((3*pi/4)*n);
g1 = h1.*un1;
g2 = h2.*un2;
z1 = ifft(fft(x).*fft(g1));
z2 = ifft(fft(x).*fft(g2));
[y1, z1STFT, y1STFT] = stft_func(z1, W1);
[y2, z2STFT, y2STFT] = stft_func(z2, W1);
figure(1);
subplot(2,1,1);
plot(n,abs(fft(g1)));
xlabel('Frequency [Hertz]'); 
ylabel('Magnitude');
title('W1 = 50');
subplot(2,1,2);
plot(n,abs(fft(g2)));
xlabel('Frequency [Hertz]'); 
ylabel('Magnitude');
title('W2 = 10');

figure(2);
subplot(2,1,1);
imagesc((0:(M1-1))*W1/Fs, (0:(W1-1))/W1, abs(z1STFT));
xlabel('Time [seconds]'); 
ylabel('Frequency [Hertz]');
title('z1');
subplot(2,1,2);
imagesc((0:(M2-1))*W2/Fs, (0:(W2-1))/W2, abs(z2STFT));
xlabel('Time [seconds]'); 
ylabel('Frequency [Hertz]');
title('z2');

soundsc(z2);