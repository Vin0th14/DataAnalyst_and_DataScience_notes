import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.preprocessing import LabelEncoder

df = sns.load_dataset('tips')         
df.head()

print(df.shape)

df1=pd.get_dummies(df, columns=["sex", "smoker"])            # 1 one hot encoding
print(df1.head())


le = LabelEncoder()                                         # 2 label encoding
print(le.fit_transform(df["sex"]))

le = LabelEncoder()
le.fit_transform(df["smoker"])

le = LabelEncoder()
print(le.fit_transform(df["day"]))

print(le.classes_)

print(le.inverse_transform(le.transform(df["day"])))

