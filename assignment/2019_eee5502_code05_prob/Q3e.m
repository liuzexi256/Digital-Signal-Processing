[x, Fs] = audioread(['chiptune_nonoise.wav']);
W = 1000;
M = floor(length(x)/W);
[y, xSTFT, ySTFT] = stft_func2(x, W);
figure(1);
subplot(1,2,1);
imagesc((0:(M-1))*W/Fs, (0:(W-1))/W, abs(xSTFT));
xlabel('Time [seconds]'); 
ylabel('Frequency [Hertz]');
axis([0 inf 0 0.5]);

subplot(1,2,2);
imagesc((0:(M-1))*W/Fs, (0:(W-1))/W, abs(ySTFT));
xlabel('Time [seconds]'); 
ylabel('Frequency [Hertz]');
axis([0 inf 0 0.5]);
soundsc(y,Fs);