import pandas as pd 
import numpy as np
import matplotlib.pyplot as plt 
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error,r2_score

marks={"Hours": [2,3,4,5,6,7,8,9,10],"Marks":[50,55,60,65,70,75,80,85,90]}

data=pd.DataFrame(marks)

print(data)                    # Taken dataset



# Splitting the target feature from dataset 

X=data.drop(columns='Marks',axis=1)
y=data["Marks"]

print(X,y)

# EDA   (Cheking assumption)

plt.scatter(X,y)

sns.scatterplot(x="Hours",y="Marks",data=data)

sns.pairplot(data)
#plt.show()

# splitting train test dataset

X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.1,random_state=42)

print(X_train,X_test)
print(y_train,y_test)

# Training and predicting the model

lm=LinearRegression()
lm.fit(X_train,y_train)
y_pred=lm.predict(X_test)

print(y_pred)

# Finding model slope and intercept

slope=lm.coef_
intercept=lm.intercept_              # our fitted regression line y=5*x+40

print(slope,intercept)

# calculating Root mean square error and  r2_score

mse=mean_squared_error(y_test,y_pred)
rmse=np.sqrt(mse)
print("RMSE :",rmse)                             # model is performing well if RMSE score is low
print("R2 score :",r2_score(y_test,y_pred))      # model is performing well if the score of r2 is high (more that 70 or 80)
                                                        # cross validation score sould be higher

# plotting residual errors
plt.figure()
plt.scatter(lm.predict(X_train),lm.predict(X_train)-y_train,color='Blue')
plt.scatter(lm.predict(X_test),lm.predict(X_test)-y_test,color='Red')
plt.title("Residual errors")
#plt.show()

# Regression line
plt.figure()
plt.scatter(X_test,y_test,color='Blue',label="Scatter plot")
plt.plot(X_test,y_pred,color="black",linewidth=3,label="Regression line")
plt.legend(loc=4)
plt.show()

# getting score

print("Score :",lm.score(X_train,y_train))









