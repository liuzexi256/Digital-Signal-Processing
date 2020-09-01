[x, Fs] = audioread(['chiptune_noise.wav']);
W = 1000;
M = floor(length(x)/W);
[y, xSTFT, ySTFT] = stft_func1(x, W);
figure(1);
subplot(1,2,1);
imagesc((0:(M-1))*W/Fs, (0:(W-1))/W, abs(xSTFT));
xlabel('Time [seconds]'); 
ylabel('Frequency [Hertz]');
axis([0 inf 0 0.15]);

subplot(1,2,2);
imagesc((0:(M-1))*W/Fs, (0:(W-1))/W, abs(ySTFT));
xlabel('Time [seconds]'); 
ylabel('Frequency [Hertz]');
axis([0 inf 0 0.15]);
soundsc(y,Fs);

figure(2);
subplot(1,2,1);
imagesc((0:(M-1))*W/Fs, (0:(W-1))/W, abs(xSTFT));
xlabel('Time [seconds]'); 
ylabel('Frequency [Hertz]');
axis([0 inf 0.9 1]);

subplot(1,2,2);
imagesc((0:(M-1))*W/Fs, (0:(W-1))/W, abs(ySTFT));
xlabel('Time [seconds]'); 
ylabel('Frequency [Hertz]');
axis([0 inf 0.9 1]);
soundsc(y,Fs);