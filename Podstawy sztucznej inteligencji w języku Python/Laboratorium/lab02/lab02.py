import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.linear_model import LinearRegression

np.random.seed(
    2001
)  # Ustawienie ziarna dla generatora liczb losowych w celu powtarzalności danych

x = np.arange(-3, 3, 0.1)  # Wygenerowanie przykładowych danych

y = (
    np.tanh(x) + np.random.randn(x.shape[0]) * 0.2
)  # Wartości funkcji tanh(x) są lekko zakłócane/zaburzane
# Funkcja np.random.randn z pakietu NumPy generuje losowe liczby z rozkładu normalnego (o średniej 0 i odchyleniu standardowym 1)

# Generowanie 5 liczb z rozkładu normalnego o średniej 10 i odchyleniu standardowym 2
# losowe_liczby = np.random.normal(loc=10, scale=2, size=5)

# Wykres funkcji tanh(x) oraz wygenerowanych danych
plt.plot(x, np.tanh(x), color="green")
plt.scatter(x, y, marker="s")
plt.legend(["tanh(x)", "wygenerowane dane"])
plt.show()

# Model wymaga, aby dane były w postaci wektora kolumnowego, domyślnie x i y to wektory wierszowe.

# (-1) - automatycznie dostosowując wymiar tablicy na podstawie pozostałych podanych wymiarów.
# Oznacza to, że NumPy sam obliczy ten wymiar tak, aby liczba elementów pozostała niezmieniona.

x = x.reshape(-1, 1)
y = y.reshape(-1, 1)

# kształt musi być taki sam
x.shape
y.shape

model = (
    LinearRegression()
)  # LinearRegression to nazwa klasy. W tym miejscu jest tworzony obiekt

model.fit(x, y)  # Dopasowanie/uczenie modelu

ypred = model.predict(x)  # Predykcja wartości

# Powyższy przypadek dotyczył tylko jednej zmiennej niezależnej, czyli model regresji liniowej ma postać y=ax+b (równanie prostej)

model.coef_  # coef_ zawiera informacje o przyjętych współczynnikach/wagach przez model, ale bez wyrazu wolnego; (wartość a);

model.intercept_  #  wyraz wolny; (wartość b)
# Aby pobrać samą liczbę z model.coef_ należy napisać -> model.coef_[0][0]

plt.scatter(x, y)
plt.xlabel("x")
plt.ylabel("y")
plt.plot(x, x * model.coef_[0][0] + model.intercept_[0], color="green")
plt.legend(["Dane", "Model"])
plt.show()

plt.scatter(x, y)
plt.xlabel("x")
plt.ylabel("y")
plt.plot(x, ypred)
plt.legend(["F(x) - aproksymująca", "f(x) - aproksymowana zaszumiona"])
plt.show()
