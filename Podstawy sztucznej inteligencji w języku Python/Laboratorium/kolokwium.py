import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier as kNN
from sklearn.tree import DecisionTreeClassifier as DT
from sklearn.ensemble import RandomForestClassifier
from sklearn.svm import SVC as SVM
from sklearn.metrics import confusion_matrix, accuracy_score, f1_score

# Etap 1:
df = pd.read_csv("data.csv")

# wyswietlenie 5 pierwszych wierszy
print(df.head())

# podstawowy opis zbioru danych
print(df.info())

# rozklad cech alcohol i color_intensity
fig, ax = plt.subplots(1, 2, figsize=(12, 6))
ax[0].hist(df["Alcohol"], bins=20, edgecolor="black", color="skyblue")
ax[0].set_title("Rozkład cechy Alcohol")
ax[0].set_xlabel("Alcohol")
ax[0].set_ylabel("Liczba obserwacji")
ax[1].hist(df["Color Intensity"], bins=20, edgecolor="black", color="skyblue")
ax[1].set_title("Rozkład cechy Color Intensity")
ax[1].set_xlabel("Color Intensity")
plt.tight_layout()
plt.show()

# boxplot dla cechy Magnesium
plt.figure(figsize=(6, 6))
plt.boxplot(df["Magnesium"])
plt.title("Boxplot dla cechy Magnesium")
plt.ylabel("Magnesium")
plt.show()

# uzupelnij ponizszy kod
print(
    f"\nWystepuja {len(df[np.abs((df['Magnesium'] - df['Magnesium'].mean()) / df['Magnesium'].std()) > 3])} wartosci odstajace"
)
print(f"Mediana cechy magnesium wynosi: {df['Magnesium'].median()}")
print(f"Srednia wartosc cechy magnesium wynosi: {df['Magnesium'].mean()}")

# Etap 2:
correlation_matrix = df.corr()
plt.figure(figsize=(16, 16))
sns.heatmap(correlation_matrix, annot=True, cmap="coolwarm", square=True)
plt.title("Macierz korelacji")
plt.show()

# uzupelnij kod
print(
    "Cecha najmocniej skorelowana dodatnio z\n cecha zalezna: [...]"
)  # nie wiem jak tutaj uzupełnić
print(
    "Cecha najmocniej skorelowana ujemnie z\n cecha zaleznia: [...]"
)  # nie wiem jak tutaj uzupełnić
print("Najmocniej skorelowane dodatnio cechy: [...]")  # nie wiem jak tutaj uzupełnić

# Etap 3:
y = np.array(df.iloc[:, -1])
X = np.array(df.iloc[:, :-1])
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)
X_train, X_test, y_train, y_test = train_test_split(
    X_scaled, y, test_size=0.3, random_state=29, shuffle=True
)

# Etap 4:
models = [
    kNN(n_neighbors=5),
    SVM(kernel="rbf"),
    DT(random_state=29),
    DT(random_state=29, criterion="entropy"),
    RandomForestClassifier(random_state=29),
]
model_names = [
    "k-Nearest Neighbors",
    "Support Vector Machine",
    "Decision Tree",
    "Decision Tree (entropy)",
    "Random Forest",
]
accuracies = []
f1s = []
for model, name in zip(models, model_names):
    model.fit(X_train, y_train)
    y_pred = model.predict(X_test)
    accuracies.append(accuracy_score(y_test, y_pred))
    f1s.append(f1_score(y_test, y_pred, average="weighted"))
    cm = confusion_matrix(y_test, y_pred)
    print(f"Model: {name}")
    print(f"Accuracy: {(accuracy_score(y_test, y_pred))}")
    print(f'F1-Score: {(f1_score(y_test, y_pred, average="weighted"))}')
    plt.figure(figsize=(10, 10))
    sns.heatmap(cm, annot=True, fmt="d", cmap="Blues")
    plt.title(f"Macierz pomyłek dla {name}")
    plt.xlabel("Predykcje")
    plt.ylabel("Wartości rzeczywiste")
    plt.show()
