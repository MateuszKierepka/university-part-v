import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv("StudentPerformanceFactors.csv", sep=",")

df.head()

df["Parental_Involvement"] = df["Parental_Involvement"].replace(
    {"Low": 1, "Medium": 2, "High": 3}
)

df["Access_to_Resources"] = df["Access_to_Resources"].replace(
    {"Low": 1, "Medium": 2, "High": 3}
)

df["Internet_Access"] = df["Internet_Access"].replace({"Yes": 1, "No": 0})

correlation_matrix = df.select_dtypes(include=[np.number]).corr()

sns.heatmap(
    correlation_matrix,
    annot=True,
    cmap="coolwarm",
    fmt=".2f",
    square=True,
    linewidths=0.5,
)

plt.title("Macierz korelacji")
plt.show()
