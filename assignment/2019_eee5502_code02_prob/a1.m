[message, code] = get_message('55314399');
a = conv(fliplr(code),message);
lag = -99:9999;
stem(lag,a);
xlabel('Lag [samples]');
ylabel('Amplitude');
[value, location] = max(a);
location = location - length(code);
disp(value);
disp(location);