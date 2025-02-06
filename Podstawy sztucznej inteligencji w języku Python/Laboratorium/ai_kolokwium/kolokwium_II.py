import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from keras.api.models import Sequential, Model
from keras.api.layers import (
    Dense,
    Conv2D,
    Concatenate,
    Input,
    Lambda,
    MaxPooling2D,
    AveragePooling2D,
    GlobalAveragePooling2D,
    Flatten,
    Dropout,
)
from keras.api.regularizers import l1, l2
from keras.api.optimizers import Adam
from keras.api.datasets import fashion_mnist
from keras.api.losses import sparse_categorical_crossentropy, categorical_crossentropy
from keras.api.metrics import Accuracy
import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt


# wlasna funkcja aktywacji
def funkcja(x):
    return 0.5 * (1.1 + tf.math.erf(x / tf.sqrt(2.5)))


# --> Zadanie 1. <--
# wczytanie danych z pliku "data2.csv" do obiektu DataFrame
data = pd.read_csv("data2.csv")
x = data.drop("Outcome", axis=1)
y = data["Outcome"]

# podzial na zbiory treningowy(75%) i testowy(25%)
x_train, x_test, y_train, y_test = train_test_split(
    x, y, test_size=0.25, random_state=42, shuffle=True, stratify=y
)

# przeskalowanie cech uzywajac StandardScaler
scaler = StandardScaler()
x_train = scaler.fit_transform(x_train)
x_test = scaler.transform(x_test)

# stworzenie modelu przy uzyciu sequential
model = Sequential()

# budowanie modelu
model.add(
    Dense(
        128,
        activation=funkcja,
        input_shape=(x_train.shape[1],),
        kernel_regularizer=l1(0.001),
    )
)
model.add(Dropout(0.1))
model.add(Dense(64, activation="relu", kernel_regularizer=l2(0.001)))
model.add(Dense(32, activation="relu", kernel_regularizer=l2(0.001)))
model.add(Dense(3, activation="softmax"))

# kompilacja modelu
model.compile(
    optimizer=Adam(learning_rate=0.001),
    loss=sparse_categorical_crossentropy,
    metrics=["accuracy"],
)

# proces uczenia modelu
model.fit(
    x_train,
    y_train,
    epochs=50,
    batch_size=16,
    validation_data=(x_test, y_test),
    verbose=2,
)

# wyswietlenie informacji o dokladnosci predykcji modelu
test_loss, test_accuracy = model.evaluate(x_test, y_test, verbose=0)
print("test loss: ", test_loss)
print("test accuracy: ", test_accuracy)


# --> Zadanie 2. <--
# wczytanie zbiorów treningowego i testowego
(x_train, y_train), (x_test, y_test) = fashion_mnist.load_data()

# dodanie dodatkowego wymiaru (kanał obrazu)
x_train = np.expand_dims(x_train, axis=-1)
x_test = np.expand_dims(x_test, axis=-1)

# utworzenie listy kolumn: 0,2,3,4,...,28
columns = [0, 2] + list(range(3, 28))

# wyswietlenie obrazu o indeksie 5 wiersze 10-28 i kolumny 0,2,3,4,...,28
plt.imshow(x_test[5, 10:29, columns], cmap="gray")
plt.title("Obraz o indeksie 5")
plt.show()

# zakodowanie zmiennej zaleznej w postaci one-hot encoding
y_train = pd.get_dummies(pd.Categorical(y_train)).values
y_test = pd.get_dummies(pd.Categorical(y_test)).values

# stworzenie modelu konwolucyjnego
# padding = 'same' - dodaje padding do obrazu, aby zachowac jego rozmiar
# padding = 'valid' - nie dodaje paddingu, obraz zmniejsza swoj rozmiar
model = Sequential()
model.add(
    Conv2D(
        32,
        kernel_size=(3, 3),
        activation="gelu",
        padding="same",
        input_shape=(28, 28, 1),
    )
)
print(model.output_shape)

model.add(Conv2D(32, kernel_size=(3, 3), activation="gelu", padding="same"))
print(model.output_shape)

model.add(MaxPooling2D(pool_size=(2, 2)))
print(model.output_shape)

model.add(Conv2D(16, kernel_size=(3, 3), activation="gelu"))
print(model.output_shape)

model.add(AveragePooling2D(pool_size=(3, 3)))
print(model.output_shape)

model.add(Flatten())
print(model.output_shape)

model.add(Dense(128, activation="relu"))
print(model.output_shape)

model.add(Dense(64, activation="relu"))
print(model.output_shape)

model.add(Dense(10, activation="softmax"))
print(model.output_shape)

# kompilacja modelu
# categorical_crossentropy: dla danych one-hot encoded
# sparse_categorical_crossentropy: dla etykiet jako pojedynczych liczb całkowitych
model.compile(
    optimizer=Adam(learning_rate=0.001),
    loss="categorical_crossentropy",
    metrics=["accuracy"],
)

# trening modelu
# verbose=0 - nie wyswietla informacji o kazdej epoce
# verbose=2 - wyswietla informacje o kazdej epoce
# validation_data - monitorowanie dokladnosci modelu na zbiorze testowym, sprawdza czy model sie nie przeucza
model.fit(
    x=x_train,
    y=y_train,
    epochs=1,
    validation_data=(x_test, y_test),
    verbose=2,
)


# --> Zadanie 3. <--
# wykorzystanie zbioru z zadania 2
input_tensor = Input(shape=x_train.shape[1:])

# definicja warstw dla lewej galezi
left_branch_layers = [
    Conv2D(32, kernel_size=(5, 5), padding="same", activation="relu"),
    MaxPooling2D(pool_size=(2, 2)),
    Conv2D(64, kernel_size=(5, 5), padding="same", activation="relu"),
    MaxPooling2D(pool_size=(2, 2)),
]

# definicja warstw dla prawej galezi
right_branch_layers = [
    Conv2D(32, kernel_size=(3, 3), padding="same", activation="gelu"),
    AveragePooling2D(pool_size=(2, 2)),
    Conv2D(64, kernel_size=(3, 3), padding="same", activation="gelu"),
    AveragePooling2D(pool_size=(2, 2)),
]

# budowanie lewej i prawej galezi
left_output = input_tensor
for layer in left_branch_layers:
    left_output = layer(left_output)

right_output = input_tensor
for layer in right_branch_layers:
    right_output = layer(right_output)

# polaczenie lewej i prawej galezi
merged_tensor = Concatenate()([left_output, right_output])

# definicja koncowych galezi
final_layers = [
    Flatten(),
    Dense(128, activation="relu"),
    Dense(10, activation="softmax"),
]

# budowanie koncowych galezi
output_tensor = merged_tensor
for layer in final_layers:
    output_tensor = layer(output_tensor)

# stworzenie modelu
model = Model(inputs=input_tensor, outputs=output_tensor)
model.compile(
    optimizer=Adam(learning_rate=0.001),
    loss=categorical_crossentropy,
    metrics=["accuracy"],
)
