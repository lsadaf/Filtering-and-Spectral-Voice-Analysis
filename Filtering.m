% Signal Processing Project - Filtering and Spectral Analysis
% Reads a noisy audio file, performs FFT, applies low-pass and high-pass filters,
% visualizes results, and saves the filtered signals as audio.

% Read audio file
[signal, fs] = audioread('noisy_song.wav');  
N = length(signal);                      % Number of samples
t = linspace(0, N/fs, N);                % Time vector

% === Original Signal Plots ===
subplot(3, 3, 1);
plot(t, signal);
title('Time Domain');

subplot(3, 3, 4);
spectrogram(signal, 512, 256, 1024, fs, 'yaxis');
title('Spectrogram');

% Frequency spectrum of original signal
subplot(3, 3, 7);
df = fs / N;                              % Frequency resolution
freq = -(fs/2):df:(fs/2 - df);            % Frequency vector
X = fftshift(fft(signal)) / N;            % Normalized FFT
plot(freq, abs(X));
title('FFT');

% === Filtering ===
W = 2000;                                 % Cutoff frequency (Hz)
LP = X;                                   % Low-pass version
HP = X;                                   % High-pass version

for i = 1:length(freq)
    if abs(freq(i)) > W
        LP(i) = 0;                        % Remove high freq
    elseif abs(freq(i)) < W
        HP(i) = 0;                        % Remove low freq
    end
end

% === Low-Pass Filter Plots ===
subplot(3, 3, 2);
lp_signal = ifft(ifftshift(LP) * N);      % Reconstruct LP signal
plot(t, real(lp_signal));
title('Time Domain LP');

subplot(3, 3, 5);
spectrogram(real(lp_signal), 512, 256, 1024, fs, 'yaxis');
title('Spectrogram LP');

subplot(3, 3, 8);
plot(freq, abs(LP));
title('FFT LP');

% === High-Pass Filter Plots ===
subplot(3, 3, 3);
hp_signal = ifft(ifftshift(HP) * N);      % Reconstruct HP signal
plot(t, real(hp_signal));
title('Time Domain HP');

subplot(3, 3, 6);
spectrogram(real(hp_signal), 512, 256, 1024, fs, 'yaxis');
title('Spectrogram HP');

subplot(3, 3, 9);
plot(freq, abs(HP));
title('FFT HP');

% === Save Filtered Audio ===
audiowrite('Low_pass.wav', real(lp_signal), fs);
audiowrite('High_pass.wav', real(hp_signal), fs);
