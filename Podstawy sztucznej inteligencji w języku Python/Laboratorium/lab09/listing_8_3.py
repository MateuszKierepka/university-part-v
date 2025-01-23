from matplotlib import pyplot as plt
from matplotlib import rcParams
from keras.api.datasets import fashion_mnist
import pandas as pd
import numpy as np
from PIL import Image
from tensorflow.keras.preprocessing.image import ImageDataGenerator


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

rotated_images = demo_images.copy()
img_size = demo_images.shape[1:]
angles = np.random.randint(-30, 30, len(rotated_images))
for i, img in enumerate(rotated_images):
    angle = np.random.randint(-30, 30)
    img = Image.fromarray(img).rotate(angle, expand=-1).resize(img_size)
    rotated_images[i] = np.array(img)
show_pictures(rotated_images)


obr = x_train[0, :, :]  # Wybierz pierwszy obraz z zestawu treningowego
obr = np.expand_dims(obr, axis=-1)  # Rozszerz wymiary, aby dodać oś kanału

data_gen = ImageDataGenerator(
    rotation_range=30,  # Losowo obracaj obrazy o 30 stopni
    width_shift_range=0.2,  # Losowo przesuwaj obrazy poziomo o 20% szerokości
    height_shift_range=0.2,  # Losowo przesuwaj obrazy pionowo o 20% wysokości
    shear_range=0.2,  # Ścinaj obrazy o 20%
    zoom_range=0.2,  # Losowo powiększaj obrazy o 20%
    horizontal_flip=True,  # Losowo odwracaj obrazy poziomo
    fill_mode="nearest",  # Wypełniaj nowo utworzone piksele najbliższą wartością piksela
)

img_gen = data_gen.flow(np.expand_dims(obr, axis=0), batch_size=1)  # Generuj obrazy

obrazki = np.zeros((10, 28, 28))  # Przygotuj tablicę na obrazy

for i in range(10):
    img = next(img_gen)[0]
    obrazki[i] = img[:, :, 0]  # Zapisz obrazy w tablicy

plt.imshow(obrazki[2], cmap="gray")  # Wyświetl pierwszy obraz
