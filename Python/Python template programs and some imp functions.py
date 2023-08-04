
#Lambda function................................
a=lambda x: x*2
print(a(2))

#Map function................................
#     map(Fun_name,[ , , ])       [list of values need to passed through the function]

# filter function..........................

#list(filter (fun_name,list_name))     (Pass the value of list to tha funtion and print the eligible value to new list)

# ZIP..............................

a=[1,2,3,4]
b=[5,6,7,8]
c=list(zip(a,b))             # Used to zip two list
print(c)

# Reduse function.............................
from functools import reduce

score=[80,90,70,75]
print(reduce(lambda x,y: x+y ,score))

# List comprehension..............................
# case 1 - only if 
list1=[1,2,3,4,5,6,7,8,9,10]
even =[num for num in list1 if num%2==0]
print(even)

# case 2 - if and else is thr 

odd_even =[str(n)+" = even" if n%2==0 else str(n)+" =odd" for n in list1]
print(odd_even)

