import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_csv(r"E:/DataScience_and_DataAnalyst_Notes/Machine Learning/Feature Engineering/dataset _ files/weight-height.csv", usecols = ["Gender", "Height"])
data.head()

print(data.describe())

plt.hist(data["Height"], bins=20, rwidth=0.8)
plt.xlabel('Height (inches)')
plt.ylabel('Count')
plt.show()

standard_deviation = data["Height"].std()
mean = data["Height"].mean()

mean, standard_deviation

UPPER_LIMIT = mean + (3*standard_deviation)
LOWER_LIMIT = mean - (3*standard_deviation)
print("Upper Limit:", UPPER_LIMIT)
print("Lower Limit:", LOWER_LIMIT)

mask = (data["Height"]<LOWER_LIMIT) | (data["Height"]>UPPER_LIMIT)
data[mask]

print(data[mask].shape)

mask = (data["Height"]>=LOWER_LIMIT) & (data["Height"]<=UPPER_LIMIT)
new_df = data[mask]

print(new_df.shape)

# Z score

def z_score(df, column):
    x = df[column].values
    mean = df[column].mean()
    standard_deviation = df[column].std()
    return (x-mean) / standard_deviation

data["Z Score"] = z_score(data, "Height")

print(data.head())

mask = (data["Z Score"]<-3) | (data["Z Score"]>3)
data[mask]

print(data[mask].shape)

mask = (data["Z Score"]>=-3) & (data["Z Score"]<=3)
new_df = data[mask]

print(new_df.shape)



