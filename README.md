# Signal Processing Project – Filtering and Spectral Analysis

## Project Overview
This project demonstrates fundamental concepts in signal processing using MATLAB:
- Time-domain signal analysis  
- Frequency-domain analysis via FFT  
- Time–frequency analysis using spectrograms  
- Low-pass and high-pass filtering in the frequency domain  
- Saving the filtered signals as audio files  

The input is a noisy audio signal (`noisy_song.wav`), and the outputs are filtered signals (`Low_pass.wav`, `High_pass.wav`) alongside plots of their behavior in time, frequency, and spectrogram domains.

---

## Files in Repository
- `noisy_song.wav` → Input noisy audio file  
- `Low_pass.wav` → Output of low-pass filtering (removes high frequencies)  
- `High_pass.wav` → Output of high-pass filtering (removes low frequencies)  
- `main.m` (MATLAB script) → Contains all code for analysis and filtering  
- `reportCA3.pdf` (optional) → Original project report (not required for running code)

---

## How It Works
The script performs the following steps:

1. **Read Audio Signal**
   - Load the input `.wav` file and plot it in the time domain.

2. **Spectrogram**
   - Compute and display the signal spectrogram to observe frequency content over time.

3. **Frequency Analysis (FFT)**
   - Apply Fast Fourier Transform (FFT) and plot the magnitude spectrum.

4. **Filtering**
   - Apply Low-Pass Filter (retains frequencies ≤ 2000 Hz).
   - Apply High-Pass Filter (retains frequencies ≥ 2000 Hz).
   - Filtering is done in the frequency domain by zeroing out unwanted frequency components.

5. **Inverse FFT**
   - Convert the filtered signals back into the time domain.

6. **Visualization**
   - For each case (original, LPF, HPF), display:
     - Time domain waveform
     - Spectrogram
     - FFT magnitude spectrum

7. **Output Audio**
   - Save filtered signals as:
     - `Low_pass.wav`
     - `High_pass.wav`

---

## Subplot Layout
The script generates a 3×3 grid of subplots:

| Subplot | Description |
|---------|-------------|
| (1,1)   | Original signal (time domain) |
| (2,1)   | Original signal spectrogram |
| (3,1)   | Original signal FFT |
| (1,2)   | Low-pass filtered signal (time domain) |
| (2,2)   | LPF spectrogram |
| (3,2)   | LPF FFT |
| (1,3)   | High-pass filtered signal (time domain) |
| (2,3)   | HPF spectrogram |
| (3,3)   | HPF FFT |


---

## How to Run
1. Open MATLAB.  
2. Place all files (`Filtering.m`, `noisy_song.wav`) in the same working directory.  
3. Run the script
4. The script will generate the 3×3 subplot figure and save:
   - Low_pass.wav
   - High_pass.wav
  
## Results

Below is an example output of the analysis and filtering process:

- Low-pass filter: Removes high-frequency noise, retains smooth/slow variations in the signal.  
- High-pass filter: Removes low-frequency components, highlights sharp/fast variations.  
- The saved audio files can be compared with the original to hear the effect of filtering.

<img width="929" height="471" alt="image" src="https://github.com/user-attachments/assets/26d48d93-efa7-44db-b6ec-57ecab8c1f9e" />
