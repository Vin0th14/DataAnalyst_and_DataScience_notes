import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns


from sklearn.feature_selection import SelectKBest
from sklearn.feature_selection import chi2

df = pd.read_csv(r"E:/DataScience_and_DataAnalyst_Notes/Data science/dataset _ files/mobile.csv")
print(df.head())

X = df.iloc[:,0:20]  # independent columns
y = df.iloc[:,-1]    # target column i.e price range


# Univariate type
bestfeatures = SelectKBest(score_func=chi2, k=10)     # apply SelectKBest class to extract top 10 best features
fit = bestfeatures.fit(X,y)

feature_scores=pd.concat([pd.DataFrame(X.columns),pd.DataFrame(fit.scores_)],axis=1)
feature_scores.columns = ["feature","scores"]
feature_scores.sort_values(by="scores", ascending=False)

print(feature_scores.nlargest(10, "scores"))

# Feature importance  (We can get the feature importance of our dataset using the feature_importance_ property of our model.)

from sklearn.ensemble import ExtraTreesClassifier
model = ExtraTreesClassifier()
model.fit(X,y)
print(model.feature_importances_)

plt.figure(figsize=(14,8)) 
plt.barh(X.columns, model.feature_importances_)
plt.title("Feature Importances")
plt.show()                                                # Ram is so related 

# Corellation matrix 

correlation_matrix = df.corr()
print(correlation_matrix)

plt.figure(figsize=(18,12))
sns.heatmap(correlation_matrix, center=0, annot=True)
plt.show()                                                # Ram is so related 


# In all 3 methods Ram is so related to Target column



