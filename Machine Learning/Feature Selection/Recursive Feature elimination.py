import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

from sklearn.feature_selection import RFE
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


# Recursive feature elimination method  (# select the top n best importance features )

rfe = RFE(estimator=RandomForestRegressor(random_state = 24), n_features_to_select=10)
rfe.fit(scaled_train, y_train)

rfe.support_
print(sum(rfe.support_))

selected_train = rfe.transform(scaled_train)
selected_test = rfe.transform(scaled_test)

print(selected_train.shape, selected_test.shape)

rf_model = RandomForestRegressor(random_state = 24)
rf_model.fit(selected_train, y_train)

print(f"Score: {rf_model.score(selected_test, y_test)}")