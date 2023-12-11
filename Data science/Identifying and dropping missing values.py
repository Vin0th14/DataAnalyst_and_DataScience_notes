import numpy as np
import pandas as pd

pd.set_option('display.max_rows', 100)

data = pd.read_csv(r"E:/DataScience_and_DataAnalyst_Notes/Data science/dataset _ files/data.csv")

data.head()

data.isnull().sum()

data.shape

# this indicates drop the rows which contains missing values
data.dropna(how="any").shape


# this indicates drop the row if all the values in the row are missing
data.dropna(how="all").shape


# this indicates drop the rows if all the values in the subset columns are missing
data.dropna(how="all", subset=["PoolQC", "Fence", "MiscFeature"]).shape

# this indicates drop the rows if any of the values in the subset columns are missing
data.dropna(how="any", subset=["PoolQC", "Fence", "MiscFeature"]).shape

# this indicates drop the rows with missing values count more than threshold
print(data.dropna(thresh=2).shape)