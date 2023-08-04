import pandas as pd
a = pd.Series([100,200,300,400])
a.index=['c','a','b','d']
b = pd.Series([800,450,100],index=('e','f','g'))
c = a.append(b)
print(c)
