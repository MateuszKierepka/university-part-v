from keras.api.layers import Conv2D, Flatten, Dense, MaxPooling2D, AveragePooling2D
from keras.api.models import Sequential
from keras.api.optimizers import Adam
from keras.api.datasets import mnist
from matplotlib import pyplot as plt
from sklearn.metrics import confusion_matrix
import seaborn as sns
import numpy as np


# Zadanie 7.2.
def plot_model_metrics(model, epochs=1000):
    historia = model.history.history
    floss_train = historia["loss"]
    floss_test = historia["val_loss"]
    acc_train = historia["accuracy"]
    acc_test = historia["val_accuracy"]

    fig, ax = plt.subplots(1, 2, figsize=(20, 10))
    epo = np.arange(0, epochs)
    ax[0].plot(epo, floss_train, label="floss_train")
    ax[0].plot(epo, floss_test, label="floss_test")
    ax[0].set_title("Funkcje strat")
    ax[0].legend()
    ax[1].set_title("Dokladnosci")
    ax[1].plot(epo, acc_train, label="acc_train")
    ax[1].plot(epo, acc_test, label="acc_test")
    ax[1].legend()
    plt.show()


def cm_for_nn(model, X_test, y_test):
    y_pred = model.predict(X_test)
    y_pred_classes = np.argmax(y_pred, axis=1)

    cm = confusion_matrix(y_test, y_pred_classes)
    sns.heatmap(cm, annot=True, fmt="d", cmap="viridis")
    plt.xlabel("Wartosci przewidziane")
    plt.ylabel("Wartości rzeczywiste")
    plt.title("Confusion Matrix")
    plt.show()


train, test = mnist.load_data()
X_train, y_train = train[0], train[1]
X_test, y_test = test[0], test[1]

X_train = np.expand_dims(X_train, axis=-1)
X_test = np.expand_dims(X_test, axis=-1)
class_cnt = np.unique(y_train).shape[0]

filter_cnt = 32
neuron_cnt = 32
learning_rate = 0.0001
act_func = "relu"
kernel_size = (3, 3)
conv_rule = "same"

model = Sequential()
model.add(
    Conv2D(
        input_shape=X_train.shape[1:],
        filters=filter_cnt,
        kernel_size=kernel_size,
        padding=conv_rule,
        activation=act_func,
    )
)
model.add(Flatten())
model.add(Dense(class_cnt, activation="softmax"))

model.compile(
    optimizer=Adam(learning_rate),
    loss="SparseCategoricalCrossentropy",
    metrics=["accuracy"],
)

model.fit(x=X_train, y=y_train, epochs=10, validation_data=(X_test, y_test))

plot_model_metrics(model, epochs=10)

cm_for_nn(model, X_test, y_test)

# Zadanie 7.3.
