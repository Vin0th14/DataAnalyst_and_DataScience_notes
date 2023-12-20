import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split

import statsmodels.api as sm

from sklearn.metrics import accuracy_score, confusion_matrix

data = pd.read_csv(r"E:/DataScience_and_DataAnalyst_Notes/Machine Learning/Logistic regression/dataset/diabetes.csv")
data.head()
print(data.info())

X = data.iloc[:, :-1]
y = data.iloc[:, -1]


# adding a constant to the independent variables
X=sm.add_constant(X)       # y=mx+c  (adding thatr constant value c to data set)

print(X.head())

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=24)
print(f"Train Data: {X_train.shape}, {y_train.shape}")
print(f"Validation Data: {X_test.shape}, {y_test.shape}")

logistic_model = sm.Logit(y_train, X_train) # initialize the model
trained_logistic_model = logistic_model.fit() # train the model
print(trained_logistic_model.summary())

predicted_probabilities = trained_logistic_model.predict(X_test)        #  predicting 
print(predicted_probabilities)                                

threshold = 0.5
predictions = (predicted_probabilities > threshold).astype(int)       # eleiminating values below threshold
print(predictions)

print(f"Accuracy of the model: {accuracy_score(y_test, predictions)}")
print(confusion_matrix(y_test, predictions))                            # accuracy score by comparing test and predicted value


#  in summary we can see that "SkinThickness", "Age" have score larger and near to 1 h=which says it is not significant so we can eliminat ethe features

# Splitting the dataset by removing non significant independent variables

X_train, X_test, y_train, y_test = train_test_split(X.drop(columns=["SkinThickness", "Age"]), y, test_size=0.2, random_state=24)
print(f"Train Data: {X_train.shape}, {y_train.shape}")
print(f"Validation Data: {X_test.shape}, {y_test.shape}")

logistic_model = sm.Logit(y_train, X_train)
trained_logistic_model = logistic_model.fit()
print(trained_logistic_model.summary())

predicted_probabilities = trained_logistic_model.predict(X_test)
print(predicted_probabilities)

threshold = 0.5
predictions = (predicted_probabilities > threshold).astype(int)
print(predictions)

print(f"Accuracy of the model: {accuracy_score(y_test, predictions)}")
print(confusion_matrix(y_test, predictions))