import numpy as np
import pandas as pd

#1 Creating series using pandas ......................................

arr = np.array(['a','b','c','d','e'])
print(arr)
print(pd.Series(arr))

#2 Assigining values.......................

a=['v','w','x','y','z']
vk =pd.Series(data=arr,index=a)
print(vk)

# Retriving data from series ............
print(vk['v'])

#............................................................ Data frames..................................................................
#1 Creating data frame ..........................................................

arr1=np.arange(0,25).reshape(5,5)
df1=pd.DataFrame(arr1,arr,a)
print(df1)

#2 Retreiving a series .................................................................
data=df1['w']
print(data)

#3 Creating and deleting new database .....................................................
df1['new'] = [1,2,3,4,5]
print(df1)                #creating column

df1.drop('new',axis=1,inplace=True)
print(df1)                #deleting column

# del df1['column name ']     

#4 fetch set of values........................................................................
#to fetch values from rows 
df1.iloc[1:3]            # [(row starting index : ending index) , (col startr : end )   iloc - for index :loc for label

print(df1.loc[['c','e'],['y','z']])

#5 conditional statements....................................................................

print(df1[df1['v']>4])           #a row will be missed

               #to fetch y and z in that result
print(df1[df1['v']>4][['y','z']])

#6 changing index values.....................................................................

new="A B C D E".split()
print(new)                #easy method to create a list with letters
df1['state']=new          #creating a rom
print(df1.set_index('state'))      #making the row as index
print(df1)

# 7 working on multilevel index .............................................................

out=['G1','G1','G1','G2','G2','G2']
ins=[1,2,3,1,2,3]
heir_index=list(zip(out,ins))
heir_index=pd.MultiIndex.from_tuples(heir_index)
df2=pd.DataFrame(np.random.randn(6,2),heir_index,['A','B'])
df2.index.names = ['Groups','Num']
print(df2)                      #multilevel index df

print(df2.loc['G1'].loc[3]['B']) #to fetch value from multilevel df

print(df2.xs(1,level='Num'))   #to fetch the value from diffrent groups

#8 Remove and Fill NAN values...................................................................

d={'A':[1,2,np.nan],'B':[6,np.nan,np.nan],'C':[1,2,3]}
df3=pd.DataFrame(d)
print(df3)

df3.dropna(inplace=True)
print(df3)                         #Dropping nan values

df4=pd.DataFrame(d)
df4.fillna(value=df4.mean(),inplace=True)
print(df4)                        #Filling nan values

#9 Group by values...............................................................................

data = {'comp':['a','a','b','b','c','c'],'name':['dxx','exx','fxx','gxx','hxx','ixx'],'stock':[33,44,34,35,29,33]}
df5=pd.DataFrame(data)
print(df5)
print(df5.groupby('comp').sum().loc['a'])
print(df5.groupby('comp').describe())

#10 Merging joining and concatening data frames....................................................

df6=pd.DataFrame({'A':['a1','a2'],'B':['b1','b2']},index=[0,1])
df7=pd.DataFrame({'A':['a3','a4'],'B':['b3','b4']},index=[2,3])
print(pd.concat([df6,df7]))                          #df=pd.concat([(df1,df2),axis=0 or 1,ignore_index=True])

df8=pd.DataFrame({'A':['a1','a2'],'B':['b1','b2'],'key':['k1','k2']},index=[0,1])
df9=pd.DataFrame({'A':['a3','a4'],'B':['b3','b4'],'key':['k1','k2']},index=[2,3])
print(pd.merge(df8,df9,on='key'))

df10=pd.DataFrame({'A':['a1','a2'],'B':['b1','b2']},index=[0,1])
df11=pd.DataFrame({'C':['a3','a4'],'D':['b3','b4']},index=[1,2])
print(df10.join(df11))
print(df10.join(df11,how='outer'))

#11 performing operations

df12=pd.DataFrame({'col1':[1,2,3],'col2':[111,333,111],'col3':['aa','bb','cc']})
print(df12['col2'].unique)                                                       #getting unique values
print(df12['col2'].value_counts())                                               #counts the num of unique values
print(df12[(df12['col1']>1)&(df12['col3']=='cc')])                               #performing multilple actions

def times2(x):
    return x*2

print(df12['col2'].apply(times2))                                                 #applying the value of data frame to a function

print(df12.sort_values('col2'))                                                  #sorting values

#12 Data input and data output.............................................................................
#df13=pd.read_excel('Excel_sample.xlsx')
#print(df13)
#df13.to_csv('Myoutput',index=False)
#print(pd.read_csv('Myoutput'))
#df14 = pd.read_html('http://www.fdic.gov/bank/individual/failed/banklist.html')
#print(df14[0])

# to read csv files

df=pd.read_csv(r"E:/DataScience_and_DataAnalyst_Notes/Python/Cloudyl data sets/blackfriday.csv")
df1=df.head(5)
print(df1)

#13 To find number of rows and columns
df.info()

#14 To find topvalues 
df.head()

#14 to find last rows
df.tail(2)
print(df)

# to find duplicates

print(df.duplicated())
df.drop_duplicates


#  df13.columns = ['a','z']  To change column names

print(df)

#date range

#syntax pd.date_range(startdate ,end date , D=day it will give days one by one , B= buisnedd days skip weekend ,w = weeks ,m =months , q=quater years)
date=pd.date_range('2020-05-01','2020-05-15',freq='D')
print(date)

time=pd.date_range('2020-05-01 00:00:00','2020-05-01 00:20:00',freq='5t')
print(time)
time1=pd.date_range('2020-05-01 00:00:00','2020-05-01 00:24:00',periods=10)   #separate in 10 equal perios
print(time1)

''' 
# 1   df1['Purchase'].idxmax()   - displays te id of max value

#2 
values=[1006038,'P00375436','F','55+',1,'C','2',0,20,2.0,11.0,365]

df1_indexed=df1.isin(values)
df1_indexed=df1.isin(values).all(axis=1)
df1[df1_indexed]                  - to find the value in dataframe

df1.sort_values(by=['Purchase'])         - sorting values

df1['Gender']=df1['Gender'].replace('F','Female')  ---replacing column values

df1[['User_ID','Age']].values.tolist()                          --converting values to list





'''






























