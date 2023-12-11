
import numpy as np
import pandas as pd
import seaborn as sn


d=pd.read_csv(r"E:/DataScience_and_DataAnalyst_Notes/Python/Cloudyl data sets/Titanic.csv")
print(d.head())

#____________________________________________________________________________________________________________________________________________________________________
# 1 Delete rows or columns with nan or null values  and Renaming .........................................................................................
#__________________________________________________________________________________________________________________________________________________________________________

d.drop(0,axis=0,inplace=True,errors='ignore')      #( index position if single value ,[list for multiple values] ,,axis based on row or column,if you want to delete row that is not present it will giv err this err cmd will ignore the error)
#print(d.head())

d.drop(d.index[0],inplace=True)                       #used to delete the row of given index to delete range we can use slicing method
#print(d.head())                        #d.drop(d.index[1:5],inplace=True)   

d.rename(columns={'PClass':'Class'},inplace=True)
print(d.head()) 

#____________________________________________________________________________________________________________________________________________________________________________
# 2 Handling Duplicate values .....................................................................................................................................
#___________________________________________________________________________________________________________________________________________________________________

ls=[(3,'vinoth',29),(2,'gokul',23),(3,'vinoth',20),(3,'vinoth',20),(3,'gokul',20),(3,'vinoth',25),(6,'saran',20),(3,'vinoth',20)]
dt=pd.DataFrame(ls,columns=('Roll No','Name','Age'))
print(dt)
print(dt.duplicated()) 

'''
print(dt[dt.duplicated()])            # only show if all values is same
print(dt[dt.duplicated(keep='last')])     # it will consider last occurence as unique and mark others as duplicate It will make everyting duplicate
print(dt[dt.duplicated(keep=False)])     # It will make everyting duplicate
print(dt[dt.duplicated(subset='Age')])       # if we pass column name it will say duplicate only in that row
print(dt[dt.duplicated(['Roll No','Name'])])   # it will print duplicates of roll no and name and avoid age if it is diffrent
'''
dt1=dt.drop_duplicates()             # to remove duplicates 
print(dt1)                          # to remove selected ones you can use above methods as same

dt1=dt.drop_duplicates('Name')             # remove all Values with VINOTH except first occurence
print(dt1)


print(d[d.duplicated()])            # NO duplcates in  titanic csv file 

#_____________________________________________________________________________________________________________________________________________________________________
# 3 Missing value Handling ...............................................................................................................................
#___________________________________________________________________________________________________________________________________________________________________ 
'''
 3 typr of missing data - MCAR MAR MNAR 
MCAR(missing completly ar random)                             - we can directly delete rows and columns
MCAR - no pattern and happens due to human error

MAR(Missing at random)                                        - imputation of data
There will be relationship betwwen data and variables

MNAR (missing not at random)                                  - improve dataset and find data
if there is structure in data and other observed data cannot explain it     then it is MNAR

 '''

 # two ways for handling missing data - Deleting(not recomended mostly only use if 80% is missing) , Imputing

 # deleting
d1=d.dropna(axis=1)
print(d.info())
print(d1.info())          # removed null value column

# Imputing 
# 1) Mean - Average ( only use if no outlier is present )
# 2) MEdian - middle most value (you can use if outlier is present also)
# 3) Mode - most frequently occuring value (used in case of categori features )
d2=d
d2['Age']=d['Age'].fillna(d['Age'].mean())
print(d.info())
d3=d
d3['Age']=d['Age'].fillna(d['Age'].median())

# 4) Arbitary value ex : if gender is asked we can fill other as option to null values instead of male / female 

# 5) Forward fill 
d.ffill()      # fills missimg value with previous value

# 6) backward fill
d.bfill()      # fills missimg value with next value

# 7) Simple Imputer from Sklearn - Single variate approach 

# 8) Linear regressing - Multi variate approach

# 9) KNN imputer - Multi variate approach

#______________________________________________________________________________________________________________________________________________________________________________
# 4 Removing Outlier ...................................................................................................................................................
#______________________________________________________________________________________________________________________________________________________________________________________

# 2 types of Outlier single variate(can be found when value in single variable space single feature) and multi variate (multiple variable or mutiple feature)

Working_Woman = [('Shreya', 28, 'Himachal', 20000),
            ('Sanju', 32, 'Delhi', 30000),
            ('Alia', 29, 'Mumbai', 25000),
            ('Sanjana', 25, 'Delhi', 45000),
            ('Saumya', 25, 'Delhi', 32000),
            ('Sanjana', 30, 'Delhi', 40000),
            ('Rinki', 32, 'Kolkata', 30000),
            ('Seema', 32, 'Delhi', 1000000),
            ('Rinki', 30, 'Delhi', 25),
            ('Ramya', 28, 'Bangalore', 52000)
            ]
df = pd.DataFrame(Working_Woman, columns = ['Name', 'Age', 'City', 'Salary'])
print(df)

# 1) we can use describe method to know if any outlier present

print(df.describe())                   # from the output  min and max are not normal from others 
print(df.describe([0.01,0.1,0.2,0.5,0.7,0.8,0.90,0.95]))       # you can get more info on where the outlier is present 

# 2) We can use visual representation to find Outlier 

import seaborn as sns
import matplotlib.pyplot as plt

sns.distplot(a=df.Salary,hist=True)
plt.show()   # From diagram we can identify the outlier skewed part there is diffrence


# Finding outlier from above data
print(df[(df.Salary < 1000)|(df.Salary > 100000)])   # we foung outlier we can also set the limit based on buisness requirement

# removing 
df1=df.copy()
df1=df1[~((df.Salary < 1000)|(df.Salary > 100000))]
print(df1)                                         # we got data without outlier 

# capping the outlier instaed of removing 
lower_percentile = 0.10
higher_percentile = 0.90
df2=df.copy()

low, high = df2.Salary.quantile([lower_percentile, higher_percentile])

df2['Salary']=np.where(df2['Salary'] >= high,high,np.where(df2['Salary'] <= low,low,df2['Salary']))
print(df2)                # replaced outlier with given percentile value 

#*********************************************** IQR - INter Quartile Range -- middle 50% of value ***********************************************************************************************************************

data = [1,  2,  3,  4,  5,  6, 10, 12, 55, 60]

# First quartile (Q1)
Q1 = np.percentile(data, 25)
print('Q1 : ',Q1)

# Third quartile (Q3)
Q3 = np.percentile(data, 75)
print('Q3 : ',Q3)

# Interquaritle range (IQR)
IQR = Q3 - Q1

print('IQR : ',IQR)

low=Q1-1.5*IQR
high=Q3+1.5*IQR

outlier =[]
for i in data:
    if (i<=low or i>=high):
        outlier.append(i)
print(outlier)

# ICR inbuilt 

from scipy import stats
IQR=stats.iqr(data)
print(IQR)          #   -  Directly we can get IQR using inbuilt functions



#**************************************************************************************************************************************************************

#------------------------------------------------------ we can find Outlier using BOX plot ----------------------------------------------------------------------------

import matplotlib.pyplot as plt
plt.figure(figsize=(7,4))
plt.boxplot(data)                     # we can also use sns.boxplot()
plt.show()

#-----------------------------------------------------we can also find using Z sore method-------------------------------------------------------------------

# *[]*[]*[]*[]*[]*[]*[]*[]----68-95-99.7 Rule ------[]*[]*[]*[]*[]*[]*[]*[]*[] ---importanat rule for all data

data1 = [32, 36, 46, 47, 56, 69, 75, 79, 79, 88, 89, 91, 92, 93, 96, 97,
          101, 105, 112, 116 , 500 , 1000]
df = pd.DataFrame(data1, columns=['Col1'])

from scipy import stats
import numpy as np

z = np.abs(stats.zscore(df))                  # we are finding Zscore using inbuilt functions   (Refer notes )
print(z)
threshold1 =3                                 # value shold not be greater than 3 standard deviation   (Refer notes )

df3 = df[(z < threshold1).all(axis=1)]
print(df3)                                   # by the 68-95-99.7 rule 500 is not outlier and it comes under 3std dev 

# At last you can remove outlier with this method--- df1=df1[~((df.Salary < 1000)|(df.Salary > 100000))]
# or you can replace it with percentile value or mean , meadian ,mode .


#________________________________________________________________________________________________________________________________________________________________________
# 5 Data visualization ----------------------------------------------------------------------------------------------------------------------------------------------------
#_____________________________________________________________________________________________________________________________________________________________________________

# Refer DataVisualDiffPlots for which diagram to use for which scenarios

# we can select diagram using 2 thigs 1)Scenarios 2)Data type that you gono plot

# 2) Data type that you gono plot ( refer notes once )

# Data visualization using Matplotlib 

# creating single axes in figure 
a=np.linspace(0,5,11)
b=a ** 2
fig = plt.figure()                       # creating figure 
axes = fig.add_axes([0.1,0.1,0.8,0.8])  # Creating axes  [left,bottom,width,height]--  ( refer note )
axes.plot(a,b,'r')                      # plotting the values in axes
axes.set_xlabel("X label")                #Labelling X and Y axis and titles
axes.set_ylabel("y label")
axes.set_title("Title")
#plt.show()                              # print the figure

# creating 2 axes in figure

fig = plt.figure()                              #Created figure with x axis y axis and height and widht
axes1 = fig.add_axes([0.1,0.1,0.8,0.8])         
axes2 = fig.add_axes([0.2,0.5,0.3,0.3])         #Creating smaller one inside bigger graph
axes1.plot(a,b)
axes2.plot(b,a)
axes1.set_title("large")
axes2.set_title("small")
#plt.show()

# creating subplots in figure 

fig,axes = plt.subplots(1,2,figsize=(8,2),dpi=100)         #(no of rows ,no of colums , figure size,dots per inch)
axes[0].plot(a,b)                    # we can plot using indexing
axes[1].plot(b,a) 
plt.tight_layout()                  #prevent overlapping
#plt.show()

# Using legends to idenify

fig = plt.figure(figsize=(4,4))
axes = fig.add_axes([0.1,0.1,0.7,0.7])  #[left,bottom,width,height]
axes.plot(a,a**2,label='Square')    #adding label so that it will help legend to identify
axes.plot(a,a**3,label='Cube')
axes.legend(loc=0,title='Legend')             #to Show legend of diagram (location of legend in diagram 0=best , 10 =center,title= you can give title)
#plt.show()

# using marker in diagram

fig = plt.figure()
axes = fig.add_axes([0.1,0.1,0.8,0.8])  #[left,bottom,width,height]
axes.plot(a,b,'r',lw=1,alpha=0.5,ls='-',marker='o')    #( , ,color,width of line,transperancy,line style,marks intersecting point)
        #for market there are lot of customization (markersize= ,markerfacecolor='',markeredgewidth= ,markeredgecolor='')
plt.grid(axis='x')                                # to display grid
#plt.show()      


# Scatter plot  using matplot lib 
fig=plt.figure(figsize=(5,5))
sales1=np.array([10,20,30,40,50,60,70,80])
profit1=np.array([1,2,3,4,5,6,7,8])
size1=np.array([20,30,40,50,60,70,80,90])
plt.scatter(sales1,profit1,color='green')    #( arr 1,arr2 ,color ,s=3 rd arr which determins size,)
sales2=np.array([33,44,22,56,78,97,44,66])
profit2=np.array([5,3,8,2,4,9,2,6])
plt.scatter(sales2,profit2,s=size1)            # we can also mention the size of the point using third one declared as array
#plt.show()

# Bar chart using matplot lib 

fig=plt.figure(figsize=(6,6))
x=np.array(['Chennai','Banglore','Kolkata'])
y=np.array([1,2,3])
plt.bar(x,y,color='m')               # we can get horizondal bar chart by plt.barh()


# Histogram using matplot lib
fig=plt.figure(figsize=(6,6))
plt.hist(y)


# Pie chart using matplot lib
fig=plt.figure(figsize=(6,6))
x=np.array([2,1,4,5])
labe=np.array(['vk','gok','saran','sus'])
plt.pie(x,labels=labe)
plt.legend(loc=0)


# count plot using Seaborn 

d=pd.read_csv(r"E:/DataScience_and_DataAnalyst_Notes/Python/Cloudyl data sets/Titanic.csv")
print(d.head()) 
fig=plt.figure(figsize=(6,6))
sn.countplot(x='Sex',data=d,hue='PClass')    # x = column name , data = datafram name , hue = it divides x based on given column in hue


# KDE plot using seaborn KDE - Kernel Distribution Estimate

fig=plt.figure(figsize=(6,6))
sn.kdeplot(x='Age',data=d)        # used to fing peak value among he column


# Distribution plot 


sn.displot(x='Age',data=d,kde=True,bins=10, hue=d['Survived'])      # same as kde but show in bar form when we keep kde true the curve also displayed
          # bins= number -- divides the age into given number of categories

# Scatter plot 

df=pd.read_csv(r"E:/DataScience_and_DataAnalyst_Notes/Python/Cloudyl data sets/Iris.csv")
print(df.head())

fig=plt.figure(figsize=(6,6))
sn.scatterplot(x='SepalLengthCm',y='PetalLengthCm',data=df,hue='Species')
           #  using scatter plot we are getting more info by comparing all 3 columns easily hue use to separate and show x and y 

# Joint plot

fig=plt.figure(figsize=(6,6))
sn.jointplot(x='SepalLengthCm',y='PetalLengthCm',data=df) # we are getting both scatter and distribution plot 
 # if hue mentioned scatter and KDE is shown

# Pair plot 
sn.pairplot(df)
plt.tight_layout() # gives all columm compared scatter plot


# Heatmap 
fig=plt.figure(figsize=(6,6))
df1=df.iloc[:,:5]
corr=df1.corr()     # the dark tone represents corelation beween two columns is large 
sn.heatmap(corr)


# Violin plot

df=pd.read_csv(r"E:/DataScience_and_DataAnalyst_Notes/Python/Cloudyl data sets/Tips.csv")

fig=plt.figure(figsize=(6,6))
sn.set_style('dark')                                 # set theme of diagram
sn.violinplot(x='day',y='total_bill',data=df,palette='plasma')     # Palette = color combo


# Strip plot 

fig=plt.figure(figsize=(6,6))
sn.stripplot(x='day',y='total_bill',data=df,palette='plasma',jitter=True) # jitter user to manage overlapping


# swarm plot

fig=plt.figure(figsize=(6,6))
sn.swarmplot(x='day',y='total_bill',data=df,palette='plasma')
plt.show() # it is same as stip plot but it udjess and prevent overlapping
                  # disadvan is cant work with large data



# |-|-|-|-|-|-|-|-|-|-|-| -Refer Assignment for EDA for more knowledge -|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|



#********************************************************************************************************************************************************************************************************88
#******************************************************************************************************************************************************************************************************************8























