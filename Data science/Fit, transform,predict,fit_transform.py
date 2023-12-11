import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, MinMaxScaler
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score

data = pd.read_csv(r"E:/DataScience_and_DataAnalyst_Notes/Data science/dataset _ files/titanic.csv", usecols=["Pclass", "Age", "Fare", "Survived"])
data.head()

data.isnull().sum()

data["Age"] = data["Age"].fillna(data["Age"].median())

data.isnull().sum()

X = data[["Age", "Fare", "Pclass"]]
y = data["Survived"]

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=24)  # Dividing into train and test datasets

print(X_train.shape, y_train.shape)                # Always user transformers after splitting
print(X_test.shape, y_test.shape)

scaler = StandardScaler()        
scaler.fit(X_train)

scaler.transform(X_train)

scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)

print(X_train)

X_test = scaler.transform(X_test)

lr_model = LogisticRegression()
lr_model.fit(X_train, y_train)

preds = lr_model.predict(X_test)
print(preds)

print(accuracy_score(y_test, preds))



# Transformers - used to transform tthe data eg. linear reggession and logistic regression data must be in scalar format so data needs to be changed
#               (fit, transform, fit_transform)


# Models - fit - train the data set & predict - predict the outcomes


