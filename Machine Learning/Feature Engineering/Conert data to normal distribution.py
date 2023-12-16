import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import scipy.stats as stats

data=pd.read_csv(r"E:/DataScience_and_DataAnalyst_Notes/Machine Learning/Feature Engineering/dataset _ files/data.csv",usecols=['Age','Fare','Survived'])
data.head()

print(data.isnull().sum())

def impute_na(data, variable):
    # function to fill na with a random sample
    df = data.copy()
    
    # random sampling
    df[variable+'_random'] = df[variable]
    
    # extract the random sample to fill the na
    random_sample = df[variable].dropna().sample(df[variable].isnull().sum(), random_state=0)
    
    # pandas needs to have the same index in order to merge datasets
    random_sample.index = df[df[variable].isnull()].index
    df.loc[df[variable].isnull(), variable+'_random'] = random_sample
    
    return df[variable+'_random']

data['Age']=impute_na(data,'Age')

print(data.isnull().sum())

def diagnostic_plots(df, variable):
    # function to plot a histogram and a Q-Q plot
    # side by side, for a certain variable
    
    plt.figure(figsize=(15,6))
    plt.subplot(1, 2, 1)
    df[variable].hist()

    plt.subplot(1, 2, 2)
    stats.probplot(df[variable], dist="norm", plot=plt)

    plt.show()

diagnostic_plots(data, 'Age')
diagnostic_plots(data, 'Fare')

data['Log_Fare']=np.log(data['Fare']+1)                # Logarithmic Transformation
diagnostic_plots(data,'Log_Fare')

data['Rec_Fare']=1/(data['Fare']+1)                    # Reciprocal transformation
diagnostic_plots(data,'Rec_Fare')

data['sqr_Fare']=data['Fare']**(1/2)                     # Sqaure Root Tansformation
diagnostic_plots(data,'sqr_Fare')

data['Exp_Fare']=data['Fare']**(1/5)                     # Exponential Tanformation
diagnostic_plots(data,'Exp_Fare')

data['Fare_boxcox'], param = stats.boxcox(data.Fare+1)     # Box cox
print('Optimal lambda: ', param)                          # you can vary the exponent as needed
diagnostic_plots(data, 'Fare_boxcox')