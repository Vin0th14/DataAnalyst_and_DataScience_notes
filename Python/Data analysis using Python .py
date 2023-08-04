import numpy as np
import pandas as pd

# Finding and replacing 0 with nan and removing nan values
d1=pd.read_csv(r"C:/Users/VI40134538\Desktop/py/Cloudyl data sets/diabetes.csv")
column_name=list(d1)                                       # getting column name as list
print(column_name)
d1[column_name[1:6]]=d1[column_name[1:6]].replace(0,np.nan) #to replace 0 with nan
print(d1.head())
d1.dropna(inplace=True)                                    # to remove nan values
print(d1.head())

# Finding and replacing ? with nan and removing nan values
d1=pd.read_csv(r"C:/Users/VI40134538\Desktop/py/Cloudyl data sets/diabetes.csv",na_values='?') # convert ? to Nan values

                                                     # perform above steps to remove nan values ^

# to remove a column
#            d1.drop(['colname'],axis = 1,inplace=True)

# to rename columns
#             df.columns=['new col 1 name','new col 2 name']

# Copyng dataframe 2 types  --- Deep copy Shallow copy 
import copy

lst1=[1,2,3,4,5]
lst2=copy.deepcopy(lst1)
lst2[0]=10                                  # copied file doesnt affect the original file
print(lst1)
lst3=copy.copy(lst1)
lst3[0]=10                                  # copied file affect the original file
print(lst3)
print(lst1)

# forward fill
        #                     df.ffill(axis=0)           #if it row axix = 0     it replace the nan values with before column or row value
# backward fill
        #                     df.bfill(axis=0)           #if it row axix = 0     it replace the nan values with after column or row value

# Interpolate..........................................

# linear 
#                       d1.interpolate()        # fills the nan values based on previous and next value of it

#polynomial 
#                            d1.interpolate(method='polynomial',order =2)   # fills based on order

# KNN impute method to fill values

df=pd.DataFrame({'Age':(20,40,30),'salary':(30,60,np.nan)})
print(df)

from sklearn.impute import KNNImputer

imputer=KNNImputer(n_neighbors=2)
df1=imputer.fit_transform(df)
print(df1)

# Data iterations 

for i in df.itertuples():
    print(i)             # it will return column values as tuples

for i,j in df.iterrows():
    print(i) 
    print(j)           # it will return colum values as rows

