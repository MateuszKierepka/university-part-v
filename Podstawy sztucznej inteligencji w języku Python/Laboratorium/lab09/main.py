import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from keras.api.datasets import fashion_mnist

# Załaduj zbiór danych Fashion MNIST
(x_train, y_train), (x_test, y_test) = fashion_mnist.load_data()

# Wyświetl kształty danych treningowych
x_train.shape
y_train.shape

# Wyświetl pierwsze dwa obrazy w zbiorze treningowym
plt.imshow(x_train[0], cmap="gray")
plt.imshow(x_train[1], cmap="gray")

# Wyświetl pierwsze 9 etykiet w zbiorze treningowym
y_train[0:9]

# Rozszerz wymiary danych treningowych
# x_train = np.expand_dims(x_train, axis=-1)
# x_test = np.expand_dims(x_test, axis=-1)
x_train.shape

# Konwertuj etykiety na kategorie
k = pd.Categorical(y_train)

# Zamień kategorie na macierz binarną
p = pd.get_dummies(k).values

# Przypisz zaktualizowane etykiety do y_train
y_train = p.astype(int)
y_train.shape

# Wyświetl fragment obrazu (kolumny od 5 do 15) z pierwszego obrazu w zbiorze treningowym
plt.imshow(x_train[0, :, 5:15], cmap="gray")
# Wyświetl fragment obrazu (wiersze od 1 do 20 co 2 wiersz) z pierwszego obrazu w zbiorze treningowym
plt.imshow(x_train[0, 1:20:2, :], cmap="gray")
# Wyświetl fragment obrazu (odwrócone wiersze, kolumny od 5 do 15) z pierwszego obrazu w zbiorze treningowym
plt.imshow(x_train[0, ::-1, :5:15], cmap="gray")
