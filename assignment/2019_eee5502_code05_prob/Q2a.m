N = 25000;
n = 0:1:N-1;
Fs = 10000;
x = cos((2*pi*n.*n)/(100000));
W = 50;
M = floor(N/W);
[y, xSTFT, ySTFT] = stft_func(x, W);
imagesc((0:(M-1))*W/Fs, (0:(W-1))/W, abs(xSTFT));
xlabel('Time [seconds]'); 
ylabel('Frequency [Hertz]');