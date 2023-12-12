
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

from sklearn.feature_selection import SelectKBest, f_classif
from sklearn.preprocessing import StandardScaler

from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import train_test_split



data = pd.read_csv(r"E:/DataScience_and_DataAnalyst_Notes/Machine Learning/Feature Selection\dataset _ files/male_data.csv", nrows=1000)
data.head()

print(data.shape)

numerics = ['int16', 'int32', 'int64', 'float16', 'float32', 'float64']
data = data.select_dtypes(include=numerics)

print(data.shape)

X = data.drop(columns="Weightlbs", axis = 1)                       # 1 separating independant and Target features
y = data.loc[:, "Weightlbs"]

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 24)
print(f"Train Data: {X_train.shape}, {y_train.shape}")             # 2 separating the train and test dataset
print(f"Test Data: {X_test.shape}, {y_test.shape}")

scaler = StandardScaler()
scaled_train = scaler.fit_transform(X_train)
scaled_test = scaler.transform(X_test)                             # 3 scaling the data

rf_model = RandomForestRegressor(random_state = 24)
rf_model.fit(scaled_train, y_train)

print(f"Score with all features : {rf_model.score(scaled_test, y_test)}")


selector = SelectKBest(f_classif, k=10)                            #  another method with less number of features
selector.fit(scaled_train, y_train)

cols = selector.get_support(indices=True)
print(cols)

X_train_selected = selector.transform(scaled_train)

print("X_train.shape: {}".format(scaled_train.shape))
print("X_train_selected.shape: {}".format(X_train_selected.shape))

X_test_selected = selector.transform(scaled_test)
X_test_selected.shape

rf_model = RandomForestRegressor(random_state = 24)
rf_model.fit(X_train_selected, y_train)

print(f"Score with limited features : {rf_model.score(X_test_selected, y_test)}")

