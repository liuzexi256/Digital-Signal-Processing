[x, Fs] = audioread(['rudenko_01.mp4']);
x = x';
W = 50;
M = floor(length(x)/W);
STFT = zeros(W, M);
for m = 1:M
    wn = [zeros(1,(m-1)*W) ones(1,W) zeros(1,length(x)-m*W)];
    xn_ex = x.*wn;
    xn_ex_sample = xn_ex((m-1)*W+1:m*W);
    xn_ex_DFT = fft(xn_ex_sample);
    STFT(:,m) = xn_ex_DFT;
end
% imagesc((0:(M-1))*W/Fs, 2*pi/W*(0:(W-1)), abs(STFT));
% xlabel('Time [seconds]');
% ylabel('Normalized Frequency [rad/s]');


imagesc((0:(M-1))*W/Fs, 2*pi/W*(0:(W-1)), 10*log10(abs(STFT)./max(max(abs(STFT)))), [-20 -5]);
xlabel('Time [seconds]');
ylabel('Normalized Frequency [rad/s]');

axis([0 inf 0 pi/20]);