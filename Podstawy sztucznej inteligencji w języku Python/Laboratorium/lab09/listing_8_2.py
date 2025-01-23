from matplotlib import pyplot as plt
from matplotlib import rcParams
from keras.api.datasets import fashion_mnist
import pandas as pd
import numpy as np

# Załaduj zbiór danych Fashion MNIST
data = fashion_mnist.load_data()
X_train, y_train = data[0][0], data[0][1]
X_test, y_test = data[1][0], data[1][1]
X_train = np.expand_dims(X_train, axis=-1)
X_test = np.expand_dims(X_test, axis=-1)
y_train = pd.get_dummies(pd.Categorical(y_train)).values
y_test = pd.get_dummies(pd.Categorical(y_test)).values

rcParams["font.size"] = 48


# Funkcja do wyświetlania obrazów
def show_pictures(arrs):
    arr_cnt = arrs.shape[0]
    fig, axes = plt.subplots(1, arr_cnt, figsize=(5 * arr_cnt, arr_cnt))
    for axis, pic in zip(axes, arrs):
        axis.imshow(pic.squeeze(), cmap="gray")
        axis.axis("off")
    fig.tight_layout()
    return fig


# Przykładowe obrazy z danych treningowych
demo_images = X_train[:10, ..., 0]
show_pictures(demo_images).suptitle("Zdjęcia pierwotne")

# Odbicia poziome obrazów
odbicia_poziome = demo_images[..., ::-1]
show_pictures(odbicia_poziome).suptitle("Odbicia poziome")

# Odbicia pionowe obrazów
odbicia_pionowe = demo_images[..., ::-1, :]
show_pictures(odbicia_pionowe).suptitle("Odbicia pionowe")
