import re
import pandas as pd
text='''
Coludyml course Regex
7339530293 , (999)-123-4567
Dhoni made his international debut in 2004. His talent with the bat came to the fore in an innings of 148 runs against Pakistan in his fifth international match
'''
#To find a number in sentece
indnum=re.findall('\d{10}',text)    # (\d is for digit , {no of characters},variable name)
print(indnum)
usnum=re.findall('\(\d{3}\)-\d{3}-\d{4}',text)  # to chek the symbols like () use \ before that which is part of inbuilt function
print(usnum)
num=re.findall('\d{10}|\(\d{3}\)-\d{3}-\d{4}',text)  # | - pipe or OR operator check for both pattern
print(num)
text1='abc.def.ghi.jkl This is pattern'
pat=re.findall("^...\....\....\....",text1)    # ^ - start of pattern $ end of pattern
print(pat)

df=pd.DataFrame({'text':['vk num is 1234567890','gok num is 1234567899','saran num is 1234567898']})
print(df)

df['number']=df['text'].str.extract('(\d{10})')    # we can get the pattern in dataframe using regex
print(df)

#other method

def exc_num(text):
    pattern='\d{10}'
    searchnum=re.search(pattern,text)    # using serach method we are finding the pattern 
    num=searchnum.group()               # grouping and returning as num
    return num
df['num using apply']=df['text'].apply(exc_num)
print(df)

# Refer screenshot and assignment of Regex for more info 

# LOOKAHEAD Positive - A(?=B) - finding exp A wch has B after it
# LOOKAHEAD Negative - A(?!B) - finding exp A wch dont have B after it
# LOOKBEHIND Positive - (?<!B)A - finding exp A wch  have B before  it
# LOOKBEHING Negative - (?<!B)A - finding exp A wch dont have B before it





