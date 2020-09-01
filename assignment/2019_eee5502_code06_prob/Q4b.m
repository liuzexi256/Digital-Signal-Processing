[x, Fs] = audioread(['noisy_speech.wav']);
W = 2000;
N = length(x);
M = 2*floor(N/W); 
[y, xSTFT, ySTFT] = overlap_addSTFT(x, W);
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