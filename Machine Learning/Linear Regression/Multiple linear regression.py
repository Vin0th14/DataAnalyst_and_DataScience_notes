import pandas as pd 
import numpy as np
import matplotlib.pyplot as plt 
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression,Lasso,Ridge,ElasticNet
from sklearn.metrics import mean_squared_error,r2_score
from sklearn.preprocessing import StandardScaler

df=pd.DataFrame({"ID":[1,2,3,4,5],"Status":["Single","Single","Single","Student","Married"]})
print(df)

print(df['Status'].map({"Single":1,"Student":3,"Married":2}))               # mapping the values

print(pd.get_dummies(df['Status']))
print(pd.get_dummies(df['Status'],drop_first=True))       # drop_first used to minimize the no of columns

# import variance_inflation_factor module

from statsmodels.stats.outliers_influence import variance_inflation_factor



# Define vif_scores function as stated above     [ Used to find how each indepenndant features or not dependant on each other]
def vif_scores(input_data):
    vif=pd.DataFrame()
    vif['variables']=input_data.columns
    vif['VIF']=[variance_inflation_factor(input_data.values,i) for i in range(input_data.shape[1])]
    return vif.sort_values(by='VIF',ascending=False)
    


# print vif scores for all current input features

# vif_scores(X)


#    Advanced linear regression 

# Lasso regression - It is regularaization technique that is used over regression methods for more accurate prediction. it also dones the feature selection part internally 
#   i.e penalizes the effect of non important features by elimanating them

# Ridge regression - It is regularaization technique. It penalizes the non important features by redusing the coefficient of features

# Elastic net regression - It is combination of Lasso and Ridge regression



