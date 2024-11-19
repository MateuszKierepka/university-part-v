import os
import numpy as np
import pandas as pd
from scipy.io import wavfile
import matplotlib.pyplot as plt

# Ścieżka do folderu z plikami audio
audio_path = "voices_pl"
audio_files = [file for file in os.listdir(audio_path) if file.endswith(".wav")]

fs = 16000  # Częstotliwość próbkowania (Hz)
seconds = 3  # Długość sygnału w sekundach
samples_per_file = fs * seconds  # Liczba próbek na plik

# Wczytywanie pierwszego pliku audio (dla wizualizacji)
file_path = os.path.join(audio_path, audio_files[0])
samplerate, data = wavfile.read(file_path)

# Dopasowanie długości do 3 sekund
if len(data) > samples_per_file:
    data = data[:samples_per_file]
elif len(data) < samples_per_file:
    padded_data = np.zeros(samples_per_file)
    padded_data[: len(data)] = data
    data = padded_data

# Wykres sygnału w dziedzinie czasu
plt.figure(figsize=(12, 8))

plt.subplot(2, 1, 1)
plt.plot(data)
plt.title("Pierwsze nagranie - sygnał w dziedzinie czasu")
plt.xlabel("Próbki")
plt.ylabel("Amplituda")

# Transformata Fouriera
fft_result = np.abs(np.fft.rfft(data))
frequencies = np.fft.rfftfreq(len(data), d=1 / fs)

# Wykres widma amplitudowego
plt.subplot(2, 1, 2)
plt.plot(frequencies, fft_result)
plt.title("Pierwsze nagranie - widmo FFT")
plt.xlabel("Częstotliwość (Hz)")
plt.ylabel("Amplituda")
plt.grid()

plt.tight_layout()
plt.show()
