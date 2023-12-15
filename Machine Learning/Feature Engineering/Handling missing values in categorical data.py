import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

df = pd.read_csv(r"E:/DataScience_and_DataAnalyst_Notes/Machine Learning/Feature Engineering/dataset _ files/train.csv")
print(df.head())

missing_categorical_columns = [column for column in df.columns if df[column].nunique()<10 and df[column].isnull().mean()>0]

len(missing_categorical_columns)                       # getting the columns with missidng data

print(df[missing_categorical_columns].isnull().sum())     # no of missing values in each column

print(df[missing_categorical_columns].isnull().mean())

print("Column:", missing_categorical_columns[0])
print(df[missing_categorical_columns[0]].value_counts())

print("Column:", missing_categorical_columns[0])
print(df[missing_categorical_columns[0]].mode()[0])

columns_to_be_dropped = [column for column in missing_categorical_columns if df[column].isnull().mean()>=0.8]   # finding column with most missing values

print(columns_to_be_dropped)

df.drop(columns=columns_to_be_dropped, inplace=True) # dropping most nan value columns
df.shape

missing_categorical_columns = [column for column in missing_categorical_columns if column not in columns_to_be_dropped]
missing_categorical_columns                             # dropping most nan value column names from list and remaing will be printed

print(df.head())

print(df[missing_categorical_columns].isnull().mean())

for column in missing_categorical_columns:
    df[column].fillna(value=df[column].mode()[0], inplace=True)

print(df[missing_categorical_columns].isnull().mean())
