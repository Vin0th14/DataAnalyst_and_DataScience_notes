import numpy as np
#1 covert list to array -----------------------
vk=[1, 2, 3, 4, 5]

arr = np.array(vk)

print(arr)



#creating array 

vk5=np.array([1,2,3,4])

print(vk5)



#2 Getting range of values------------------
arr1=np.arange(0,10,2) 

print(arr1)

#3 zeros--------------------------------

arr2=np.zeros((2,3))

print(arr2)

#4 linspace------------separates the values into equal parts

arr3=np.linspace(0,5,11)

print(arr3)

#5 eye---------prints the value in shape----identity matrix

arr4=np.eye(4)

print(arr4)

#6 random.rant -------create array with random numbers between 0 and 1

arr5=np.random.rand(5,5)

print(arr5)

#7 reshape ----change the shape of array

print(arr4.reshape(8,2))
print(arr4.reshape(8,-1)) # if you dont know the correct dimension you can use -1 python identify it

#8 max and min value

print(arr1.max())

print(arr1.argmax()) #returns position or index value of max value

#9 returns shape of array

print(arr1.shape)

#10 data type

print(arr1.dtype)

#11 taking the value of mentioned index values

print(arr[1])

print(arr[1:3])

#12 operations on array

print(arr[arr>3])

#13 Taking out mulitiple values from 2d array

arr=np.arange(50).reshape(5,10)
print(arr)
print(arr[1:3,4:7])              #syntax  = (row strt:row end , col strt:col end) for 2 d
                                 # 3d = (mat strt:mat end ,row strt:row end , col strt:col end)

#14 ***important***---Diff between array and list is array will change the value of orginal even if it chaged in future

import numpy as np

vk=[1,2,3,4,5,6,7]
arr=np.array(vk)
arr[0:3]=100
print(arr)
slice_of_arr=arr[0:4]
slice_of_arr[:]=99
print(slice_of_arr)
print(arr)

#15 copy method ---not affect original array

arr6=np.arange(7)
arr_copy=arr6.copy()
arr_copy[:2]=5
print(arr6)
print(arr_copy)

#16 Filtering using where condition

stock=np.array([3,5,7,0,3])
state=np.where(stock>0,"in stock",'out of stock')
print(state)

#17 Sorting arrays

number=np.array([5,6,3,7,4,2,9,1])
arr_num=np.sort(number)
print(arr_num)

#filtering arrays

arr6 = np.array([41, 42, 43, 44])
x = [True, False, True, False]
newarr = arr6[x]
print(newarr)

print(np.ndim(vk5))          # prints whether array is one dimension or 2d or 3 d
scar=np.array(0)
print(np.ndim(scar))           

# hstack and v stack
a=np.array([1,2,3])
b=np.array([4,5,6])
c=np.hstack((a,b))            # joins 2 arrays horizondally
print(c)
d=np.vstack((a,b))
print(d)

# concatenating arrays
a=[[1,2],[4,5]]
A=np.array(a)
print(A.shape)

b=[[7],[8]]
B=np.array(b)
print(B.shape)

c=[[9,10]]
C=np.array(c)
print(C.shape)

d=np.concatenate((a,c),axis=0)                             # if colum is equal the axis = 0  (equal ,aixs =1) (axis=0,equal)
print(d)
e=np.concatenate((a,b),axis=1)
print(e)

#Append insert 
ary=np.array([1,2,3])
ary1=np.append(ary,45)                                  #to append single value
print(ary1)                              #Doesnt affect original array
ary2=np.append(ary,[6,7,8])                            # to append multiple value
print(ary2)

b=np.array(([1,2],[3,4],[4,5]))
b1=np.append(b,[[6,7]],axis=0)                  #appending a row then axis=0
print(b1)

b=np.array(([1,2],[3,4],[4,5]))
b1=np.append(b,[[6],[7],[8]],axis=1)                  #appending a row then axis=0
print(b1)

# inserting..................................................
c=np.array([1,2,3,4])
c1=np.insert(c,1,-100)    # inserts -100 at position 1
print(c1)

d=np.array(([1,2],[3,4],[4,5]))
d1=np.insert(d,1,[[5,6]],axis=0)
print(d1)

d=np.array(([1,2],[3,4],[4,5]))
d1=np.insert(d,1,[[5,6,7]],axis=1)
print(d1)

#deleting
c2=np.delete(c,1)
print(c2)                      #Deleting

d2=np.delete(d,1,axis=0)          #(array name,row or coumn,axis=0if it is row ,1 if it is column)
print(d2)

# where condition................................................
A=np.arange(0,11)
print(type(A))
B=np.where(A<5,A,A*10)                #( condition , name of array , action)
print(B)

#random ..................................

ran=np.random.choice([7,18,8],p=[0.5,.2,.3],size=(3,3))       #Randomly creates array with give choise in provided size and probablity of number in array
print(ran)





