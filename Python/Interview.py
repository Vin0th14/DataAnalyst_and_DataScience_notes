import copy

a=[[1,2,3],[4,5,6],[7,8,9]]
b=copy.copy(a)
a[0][0]=111
print(a,b)

c=[[1,2,3],[4,5,6],[7,8,9]]
d=copy.deepcopy(c)
c[0][0]=0
print(c,d)
#---------------------------------------------------------------------------------------------------------------------------------------------

l=[5,6,4,3,2,7,8,1]
sorted(l)
print(l)                                       # Diff between sort and sorted
l.sort()
print(l)

#--------------------------------------------------------------------------------------------------------------------------------------------
def triangle(n):
    k = n - 1
    for i in range(0, n):
        for j in range(0, k):
            print(end=" ")
        k = k - 1
        for j in range(0, i+1):
            print("* ", end="")
        print("\r")
n = 5
triangle(n)
#----------------------------------------------------------------------------
for i in range(4):
    for j in range(i+1):
        print('*',end="")
    print()
#-----------------------------------------------------------------------------
for i in range(4):
    for j in range(4-i):
        print('*',end="")
    print()
#-----------------------------------------------------------------------------
a="VINOTH"
b=a[::-1]                   # palindrome
print(b)
#------------------------------------------------------------------------------
num = 5
factorial = 1
if num < 0:
   print("Sorry, factorial does not exist for negative numbers")
elif num == 0:
   print("The factorial of 0 is 1")
else:
   for i in range(1,num + 1):
       factorial = factorial*i
   print("The factorial of",num,"is",factorial)
#------------------------------------------------------------------------------
try:
    print(2/1)  # it will show error for zero diviision
except:
    print("execued if any error found")                # error handling
else:
    print("it will print if no error is in try block")
finally:
    print("print no matter what")
#------------------------------------------------------------------------------------------------------------------------------------------------------------

import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

#-------------------------------------------------------------------------------------------------------------------------------------------------

d=pd.read_csv(r"E:/DataScience_and_DataAnalyst_Notes/Python/Cloudyl data sets/Titanic.csv")
print(d.head())
print(d.duplicated())
d.drop_duplicates()
print(d.duplicated())
print(d.info())
d.dropna(inplace=True)
print(d.info())

sns.distplot(a=d.Age,hist=False)
plt.show() 

Q1=d['Age'].quantile(0.25)
print(Q1)
Q3=d['Age'].quantile(0.75)
print(Q3)
IQR=Q3-Q1
print(IQR)
low=Q1-1.5*IQR
high=Q3+1.5*IQR
print(low,high)
d1=d.copy(deep=True)
d1[~((d1['Age']<low)|(d1["Age"]>high))]
print(d1.info())

"""outlier =[]
for i in d.Age:
    if (i<=low or i>=high):
        outlier.append(i)
print(outlier)"""

#--------------------------------------------------------------------------------------------------------------------------------------
sns.boxplot(d.Age)
plt.show()
#---------------------------------------------------------------------------------------------------------------------------------------
sns.scatterplot(x=d.Age,y=d.Survived)
plt.show()
#----------------------------------------------------------------------------------------------------------------------------------------
sns.barplot(x=d.Age,y=d.Sex)
plt.show()
#------------------------------------------------------------------------------------------------------------------------------------------------
'''fig=plt.figure(figsize=(6,6))
plt.pie(x=d.Age,labels=d.Sex)
plt.show()'''
#-----------------------------------------------------------------------------------------------------------------------------------------
sns.countplot(x=d.Sex,data=d,hue=d.Survived)
plt.show()
#--------------------------------------------------------------------------------------------------------------------------------------------
sns.kdeplot(x=d.Age)
plt.show()
#-----------------------------------------------------------------------------------------------------------------------------------------
sns.displot(x='Age',data=d,kde=True, hue=d['Survived'])
plt.show()
#-------------------------------------------------------------------------------------------------------------------------------------------
sns.pairplot(d)
plt.tight_layout()
plt.show()
#--------------------------------------------------------------------------------------------------------------------------------------------------

