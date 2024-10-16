import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

# ZADANIE 1.2 Indeksowanie zaawansowane tablic numpy

DataFrame = pd.read_excel("C:/Users/mateu/Desktop/Studia/V-SEMESTR/Podstawy sztucznej inteligencji w języku "
                          "Python/Laboratorium/files/lab 1/practice_lab_1.xlsx")

arr = np.array(DataFrame.values)
nazwyKolumn = list(DataFrame.columns)

# polecenie 1

arr1 = arr[::2, :] - arr[1::2, :]
print(arr1)

# polecenie 2

arr2 = (arr - arr.mean()) / arr.std()
# print(arr2)

# polecenie 3

arr3 = (arr - arr.mean(axis=0)) / (arr.std(axis=0) + np.spacing(arr.std(axis=0)))
# print(arr3)

# polecenie 4

arr4 = (arr.mean(axis=0) / (arr.std(axis=0) + np.spacing(arr.std(axis=0))))
# print(arr4)

# polecenie 5

maxIndex = np.argmax(arr4)
maxValue = arr4[maxIndex]
# print(maxValue)

# polecenie 6

meanColumns = arr.mean(axis=0)
greaterMean = arr > meanColumns
count = greaterMean.sum(axis=0)
# print(count)

# polecenie 7

maxValue2 = arr.max()
columnsMaxValue = arr == maxValue2
columnsTrue = np.any(columnsMaxValue, axis=0)
columnsIndex = np.where(columnsTrue)[0]
# print([nazwyKolumn[i] for i in columnsIndex])

# polecenie 8

columnsMasked = arr == 0
zeroCount = np.sum(columnsMasked, axis=0)
maxIndex2 = np.argmax(zeroCount)
# print(nazwyKolumn[maxIndex2])

# polecenie 9

columns = arr[::2, ].sum(axis=0) > arr[1::2, ].sum(axis=0)
index = np.where(columns)[0]
# print([nazwyKolumn[i] for i in index])

# ZADANIE 1.3 Podstawowe możliwości biblioteki matplotlib

# x = np.arange(-5, 5, 0.01)
#
# y1 = np.tanh(x)
# plt.figure(figsize=(8, 6))
# plt.plot(x, y1)
# plt.grid(True)
#
# y2 = (np.exp(x) - np.exp(-x)) / (np.exp(x) + np.exp(-x))
# plt.figure(figsize=(8, 6))
# plt.plot(x, y2)
# plt.grid(True)
#
# y3 = 1 / (1 + np.exp(-x))
# plt.figure(figsize=(8, 6))
# plt.plot(x, y3)
# plt.grid(True)
#
#
# def y4_function(x):
#     if x <= 0:
#         return 0
#     else:
#         return x
#
#
# y4 = [y4_function(i) for i in x]
# plt.figure(figsize=(8, 6))
# plt.plot(x, y4)
# plt.grid(True)
# plt.show()
#
#
# def y5_function(x):
#     if x <= 0:
#         return np.exp(x) - 1
#     else:
#         return x
#
#
# y5 = [y5_function(i) for i in x]
# plt.figure(figsize=(8, 6))
# plt.plot(x, y5)
# plt.grid(True)
# plt.show()

tabCorr = DataFrame.corr()
values = np.array(tabCorr.values)
fig, ax = plt.subplots(len(values), len(values), figsize=(10, 10))
for i in range(len(values)):
    for j in range(len(values)):
        if i != j:
            ax[i, j].scatter(values[:, i], values[:, j])

plt.tight_layout()
# plt.show()

