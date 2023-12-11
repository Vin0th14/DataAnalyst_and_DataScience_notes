import numpy as np
import pandas as pd

from sklearn.feature_selection import VarianceThreshold

sample_data = pd.DataFrame({
    "A":[1,2,4,1,2,4], 
    "B":[4,5,6,7,8,9], 
    "C":[0,0,0,0,0,0],
    "D":[1,1,1,1,1,1]
})

print(sample_data)

variance_threshold = VarianceThreshold(threshold=0)        # importing with 0 threshold
variance_threshold.fit(sample_data)

variance_threshold.get_support()                # Return bolllean values True if no constant values and False if it has constant values

columns_to_drop = sample_data.columns[~variance_threshold.get_support()]
columns_to_drop

sample_data.drop(columns_to_drop, axis = 1)

# Applying Variance Threshold on Large Dataset

data = pd.read_csv(r"E:/DataScience_and_DataAnalyst_Notes/Data science/dataset _ files/train.csv", nrows=10000)
data.head()

X=data.drop(labels=['TARGET'], axis=1)
print(X.head())
y=data['TARGET']

variance_threshold = VarianceThreshold(threshold=0)
variance_threshold.fit(X)

print(sum(variance_threshold.get_support()))             # returning sum of non constant columns

total_constant_features = X.shape[1] - sum(variance_threshold.get_support())
total_constant_features                             # returning sum of constant columns

constant_columns = X.columns[~variance_threshold.get_support()]   # method to eliminat the constant columns 

print(constant_columns)

z=X.drop(columns = constant_columns, axis = 1)        # dropping constant columns

print(z.head())







