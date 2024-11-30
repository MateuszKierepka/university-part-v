import pandas as pd
from matplotlib import pyplot as plt
import numpy as np
import seaborn as sns
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier as kNN
from sklearn.tree import DecisionTreeClassifier as DT
from sklearn.ensemble import RandomForestClassifier
from sklearn.svm import SVC as SVM
from sklearn.metrics import confusion_matrix, accuracy_score, f1_score

df = pd.read_csv("data.csv")

# 5 pierwszych wierszy
print(df.head())

# podstawowy opis zbioru
print("\nPodstawowy opis zbioru danych:")
print(f"\nLiczba wierszy: {df.shape[0]}, liczba kolumn: {df.shape[1]}")
print("\nNazwy kolumn: ", list(df.columns))
print("\nTypy danych:")
print(df.dtypes)

# rozklad cech alcohol i color_intensity
alcohol_counts = df["Alcohol"].round(1).value_counts().sort_index()
color_intensity_counts = df["Color Intensity"].round(1).value_counts().sort_index()
fig, ax = plt.subplots(1, 2, figsize=(12, 6))
ax[0].bar(
    alcohol_counts.index, alcohol_counts.values, color="skyblue", edgecolor="black"
)
ax[0].set_title("Rozkład cechy Alcohol")
ax[0].set_xlabel("Alcohol")
ax[0].set_ylabel("Liczba obserwacji")
ax[1].bar(
    color_intensity_counts.index,
    color_intensity_counts.values,
    color="skyblue",
    edgecolor="black",
)
ax[1].set_title("Rozkład cechy Color Intensity")
ax[1].set_xlabel("Color Intensity")
ax[1].set_ylabel("Liczba obserwacji")
plt.tight_layout()
plt.show()

# boxplot dla cechy Magnesium
plt.figure(figsize=(6, 6))
plt.boxplot(df["Magnesium"])
plt.title("Boxplot dla cechy Magnesium'")
plt.ylabel("Magnesium")
plt.show()

# uzupelnij ponizszy kod
print(
    f"\nWystepuja {len(df[np.abs((df['Magnesium'] - df['Magnesium'].mean()) / df['Magnesium'].std()) > 3])} wartosci odstajace"
)
print(f"Mediana cechy magnesium wynosi: {df['Magnesium'].median()}")
print(f"Srednia wartosc cechy magnesium wynosi: {df['Magnesium'].mean()}")

# Etap 2 - macierz korelacji
correlation_matrix = df.corr()
plt.figure(figsize=(16, 16))
sns.heatmap(correlation_matrix, annot=True, cmap="coolwarm", square=True)
plt.title("Macierz korelacji cech")
plt.show()

# uzupelnij kod
print(
    "Cecha najmocniej skorelowana dodatnio z\n cecha zalezna: [...]"
)  # nie wiem jak tutaj uzupełnić
print(
    "Cecha najmocniej skorelowana ujemnie z\n cecha zaleznia: [...]"
)  # nie wiem jak tutaj uzupełnić
print("Najmocniej skorelowane dodatnio cechy: [...]")  # nie wiem jak tutaj uzupełnić

# Etap 3 - skalowanie cech numerycznych StandardScaler
df = pd.read_csv("data.csv")
y = np.array(df.iloc[:, -1])
X = np.array(df.iloc[:, :-1])
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

X_train, X_test, y_train, y_test = train_test_split(
    X_scaled, y, test_size=0.3, random_state=29, shuffle=True
)

# Etap 4 - modele
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
class_labels = ["Loan_Status: No", "Loan_Status: Yes"]
accuracies = []
f1_scores = []
for model, name in zip(models, model_names):
    model.fit(X_train, y_train)
    y_pred = model.predict(X_test)
    cm = confusion_matrix(y_test, y_pred)
    sns.heatmap(
        cm,
        annot=True,
        fmt="d",
        cmap="Blues",
        xticklabels=class_labels,
        yticklabels=class_labels,
    )
    plt.xlabel("Predykcje")
    plt.ylabel("Wartości rzeczywiste")
    plt.title(f"Macierz pomyłek dla {name}")
    plt.show()
    accuracies.append(accuracy_score(y_test, y_pred))
    f1_scores.append(f1_score(y_test, y_pred))

metrics = ["Accuracy", "F1 Score"]
values = np.array([accuracies, f1_scores])
fig, ax = plt.subplots(figsize=(10, 6))
width = 0.35
x = np.arange(len(metrics))

for i, metric in enumerate(metrics):
    ax.bar(x - width / 2 + i * width, values[i], width, label=metric)
ax.set_xticks(x)
ax.set_xticklabels(model_names, rotation=45, ha="right")
ax.set_ylabel("Wartość")
ax.set_title("Porównanie metryk dla różnych modeli")
ax.legend()
plt.tight_layout()
plt.show()
