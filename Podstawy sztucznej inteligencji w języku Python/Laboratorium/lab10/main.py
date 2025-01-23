import numpy as np
import pandas as pd
import tensorflow as tf
from keras.api.datasets import mnist, cifar10
from keras.api.models import Model
from keras.api.layers import (
    Input,
    Conv2D,
    MaxPooling2D,
    Dense,
    GlobalAveragePooling2D,
)
from keras.api.layers import concatenate
from keras.api.utils import plot_model


(x_train, y_train), (x_test, y_test) = cifar10.load_data()
x_train.shape

(x_train, y_train), (x_test, y_test) = mnist.load_data()
x_train.shape

x_train = np.expand_dims(x_train, axis=-1)
x_test = np.expand_dims(x_test, axis=-1)

y_train = pd.get_dummies(pd.Categorical(y_train)).values
y_test = pd.get_dummies(pd.Categorical(y_test)).values

input_tensor = Input(shape=x_train.shape[1:])
output_tensor = input_tensor
output_tensor.shape

output_tensor = Conv2D(32, (3, 3), padding="same", activation="selu")(output_tensor)
output_tensor.shape

output_tensor = MaxPooling2D(pool_size=(2, 2))(output_tensor)
output_tensor.shape


def my_act(tensor):
    return tf.math.tanh(tensor) * 0.5


output_tensor = Conv2D(32, (3, 3), padding="valid", activation=my_act)(output_tensor)
output_tensor.shape

output_tensor = GlobalAveragePooling2D()(output_tensor)
output_tensor.shape

output_tensor = Dense(10, activation="relu")(output_tensor)

filter_cnt = 32
kernel_size = (3, 3)
act_func = "relu"
class_cnt = 10

layers = [
    Conv2D(filter_cnt, kernel_size, activation=act_func),
    MaxPooling2D(2, 2),
    Conv2D(filter_cnt, kernel_size, activation=act_func),
    MaxPooling2D(2, 2),
    Conv2D(filter_cnt, kernel_size, activation=act_func),
    GlobalAveragePooling2D(),
    Dense(class_cnt, activation="softmax"),
]

output_tensor = input_tensor = Input(x_train.shape[1:])
for layer in layers:
    output_tensor = layer(output_tensor)

model = Model(inputs=input_tensor, outputs=output_tensor)


def add_inception_module(input_tensor):
    act_func = "relu"
    paths = [
        [Conv2D(filters=64, kernel_size=(1, 1), padding="same", activation=act_func)],
        [
            Conv2D(filters=96, kernel_size=(1, 1), padding="same", activation=act_func),
            Conv2D(
                filters=128, kernel_size=(3, 3), padding="same", activation=act_func
            ),
        ],
        [
            Conv2D(filters=16, kernel_size=(1, 1), padding="same", activation=act_func),
            Conv2D(filters=32, kernel_size=(5, 5), padding="same", activation=act_func),
        ],
        [
            MaxPooling2D(pool_size=(3, 3), strides=1, padding="same"),
            Conv2D(filters=32, kernel_size=(1, 1), padding="same", activation=act_func),
        ],
    ]
    for_concat = []
    for path in paths:
        output_tensor = input_tensor
        for layer in path:
            output_tensor = layer(output_tensor)
        for_concat.append(output_tensor)
    return concatenate(for_concat)


output_tensor = input_tensor = Input(x_train.shape[1:])
inception_module_cnt = 2
for i in range(inception_module_cnt):
    output_tensor = add_inception_module(output_tensor)
output_tensor = GlobalAveragePooling2D()(output_tensor)
output_tensor = Dense(class_cnt, activation="softmax")(output_tensor)

ANN = Model(inputs=input_tensor, outputs=output_tensor)
ANN.compile(loss="categorical_crossentropy", metrics=["accuracy"], optimizer="adam")

plot_model(ANN, show_shapes=True)
