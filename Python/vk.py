import pandas as pd
import numpy as np
import seaborn as sns #visualisation
import matplotlib.pyplot as plt #visualisation

sns.set(color_codes=True)
from scipy import stats
import warnings
warnings.filterwarnings("ignore")
df = pd.read_csv(r"C:/Users/VI40134538\Desktop/py/Cloudyl data sets/CAR.csv")
print('chck')




Q1 = df.quantile('0.25')
Q3 = df.quantile('0.75')