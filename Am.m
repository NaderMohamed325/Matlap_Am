% Parameters
Fs = 1000;          % Sampling frequency
t = 0:1/Fs:1-1/Fs;  % Time vector
fc = 100;           % Carrier frequency
fm = 5;             % Modulation frequency
kf = 50;            % Frequency deviation constant

% Modulating signal
m = sin(2*pi*fm*t);

% Carrier signal
c = cos(2*pi*fc*t);

% Frequency modulation
y = cos(2*pi*fc*t + kf*cumsum(m)/Fs);

% Plotting
figure('Position', [100, 100, 1200, 800]);

subplot(5,1,1);
plot(t, m);
title('Modulating Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5,1,2);
plot(t, c);
title('Carrier Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5,1,3);
f = -Fs/2:Fs/length(m):Fs/2-Fs/length(m);
plot(f, abs(fftshift(fft(m))));
title('Frequency Spectrum of Modulating Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([-30, 30]);  % Adjust x-axis limits for better visibility

subplot(5,1,4);
plot(f, abs(fftshift(fft(c))));
title('Frequency Spectrum of Carrier Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([-200, 200]);  % Adjust x-axis limits for better visibility

subplot(5,1,5);
plot(f, abs(fftshift(fft(y))));
title('Frequency Spectrum of Modulated Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([-200, 200]);  % Adjust x-axis limits for better visibility

% Save figures
saveas(gcf, 'FM_plots.png');