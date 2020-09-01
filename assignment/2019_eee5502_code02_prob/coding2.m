x1 = sin(pi/10*(0:19));
x2 = 2*(mod((0:19)/10,1)-0.5);
x3 = cos(pi/2*(0:19));
x4 = (-1).^(0:19);
z = [x1 x2 x3 x4];

% Q3 (a)
stem(z);

% Q3 (b)
n = 0:1:19;
hh1 = dirac(n);
hh2 = dirac(n-5);
hh3 = dirac(n-19);
h1 = 1*sign(hh1);
h2 = 1*sign(hh2);
h3 = 1*sign(hh3);
y1 = conv(x1,h1);
y2 = conv(x1,h2);
y3 = conv(x1,h3);
stem(Y);

% Q4 (a)
a1 = conv(fliplr(x1), x1);
lag = -(20-1):(20-1);
stem(lag, a1);
xlabel('Lag [samples]');
ylabel('Amplitude');

% Q4 (b)
a2 = conv(fliplr(x2), x2);
lag = -(20-1):(20-1);
stem(lag, a2);
xlabel('Lag [samples]');
ylabel('Amplitude');

a3 = conv(fliplr(x3), x3);
lag = -(20-1):(20-1);
stem(lag, a3);
xlabel('Lag [samples]');
ylabel('Amplitude');

a4 = conv(fliplr(x4), x4);
lag = -(20-1):(20-1);
stem(lag, a4);
xlabel('Lag [samples]');
ylabel('Amplitude');

% Q4 (c)
z1 = conv(fliplr(x1),z);
z2 = conv(fliplr(x2),z);
z3 = conv(fliplr(x3),z);
z4 = conv(fliplr(x4),z);
n = -(20-1):(80-1); % the x-axis, determine yourself based on Question #2
stem(n, z4);
xlabel('Lag [samples]');
ylabel('Amplitude');