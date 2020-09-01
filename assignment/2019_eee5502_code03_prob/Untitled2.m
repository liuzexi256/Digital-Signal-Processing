ii = 1;
[y, Fs] = audioread(['rudenko_' num2str(ii, '%02i') '.mp4']);
t = 1/Fs:1/Fs:length(y)/Fs;
plot(t, y);
xlabel('Time [sec]')
ylabel('Amplitude')