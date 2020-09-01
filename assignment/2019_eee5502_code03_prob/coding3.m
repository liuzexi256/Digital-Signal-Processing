tic

n = 1:39;
M1 = 0;
M2 = 0;
findn = 0;
s = 0;
for n = 1:39
    ii = n;
    [y, Fs] = audioread(['rudenko_' num2str(ii, '%02i') '.mp4']);
    y = y';
    s = length(y);
    [findme, Fs] = get_tune('55314399');
    findme = findme';
    findme2 = [findme zeros(1,s-44100)];
    findme3 = conj(fft(findme2));
    y2 = ifft(fft(y).*findme3);
    [M1,index] = max(y2);
    if M1 > M2
        M2 = M1;
        findn = n;
        indexn = index;
        y3 = y;
    else
        M2 = M2;
    end
end

t = 1/Fs:1/Fs:length(findme)/Fs;
time = indexn/Fs;
minute = fix(time/60);
second = mod(time,60);
plot(t, findme);
xlabel('Time [sec]');
ylabel('Amplitude');
disp(['rudenko_' num2str(findn) '.mp4']);
disp([num2str(minute) ':' num2str(second)]);

toc
