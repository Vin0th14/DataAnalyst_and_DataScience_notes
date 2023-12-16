import pandas as pd
import numpy as np

from sklearn.preprocessing import MinMaxScaler, StandardScaler, Normalizer, Binarizer

data = pd.read_csv(r"E:/DataScience_and_DataAnalyst_Notes/Machine Learning/Feature Engineering/dataset _ files/wine.csv", usecols = ["fixed acidity", "residual sugar"])
data.head()

m_scaler = MinMaxScaler()
scaled_data = m_scaler.fit_transform(data.dropna())
print(scaled_data)

s_scaler = StandardScaler()
scaled_data = s_scaler.fit_transform(data.dropna())
print(scaled_data)

normalizer = Normalizer()
scaled_data = normalizer.fit_transform(data.dropna())
print(scaled_data)

binarizer = Binarizer()
scaled_data=binarizer.fit_transform(data.dropna())
print(scaled_data)