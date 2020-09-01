n = 0:1:2500;
W = 50;
xn = cos((2*pi*n.*n)/(10000));
M = floor(length(xn)/W);
STFT = zeros(W, M);
for m = 1:M
    wn = [zeros(1,(m-1)*W) ones(1,W) zeros(1,length(xn)-m*W)];
    xn_ex = xn.*wn;
    xn_ex_sample = xn_ex((m-1)*W+1:m*W);
    xn_ex_DFT = fft(xn_ex_sample);
    STFT(:,m) = xn_ex_DFT;
end
imagesc(0:(M-1), 2*pi*(0:(W-1))/W, abs(STFT));
xlabel('Time [samples]');
ylabel('Normalized Frequency [rad/s]');