

import filecmp
import os

os.getcwd()                                      # Shows currenct directory
#os.chdir(path should be given)                       used to change directory
#os.listdir( "")                                     list the directory

# creating directory...............
directory="demo1"                                             #directory name
parent_dir="C:/Users/VI40134538/Desktop/Numpy/"               #directory path 
path=os.path.join(parent_dir,directory)
os.mkdir(path)
print('Directory ',directory,' created' )


directory="demo2"                                             #directory name
parent_dir="C:/Users/VI40134538/Desktop/Numpy/"               #directory path 
mode=0o66
path=os.path.join(parent_dir,directory)
os.mkdir(path,mode)
print('Directory ',directory,' created' )

# creating directories.........

directory="demo5"                                                          #directory name
parent_dir="C:/Users/VI40134538/Desktop/Numpy//demo3/demo4"               #directory path (demo 3 , 4 are created)
path=os.path.join(parent_dir,directory)
os.makedirs(path)                                              # ^it will create demo 3 demo 4 and demo 5 dirctory ^
print('Directory ',directory,' created' )

# Deleting file (we cant delete directory)

'''file='file name'
parent_dir="C:/Users/VI40134538/Desktop/Numpy//demo3/demo4" 
path=os.path.join(parent_dir,file)
os.remove(path)'''

# removing directory 

directory="demo1"                                             #directory name
parent_dir="C:/Users/VI40134538/Desktop/Numpy/"               #directory path 
path=os.path.join(parent_dir,directory)
os.rmdir(path)
print('Directory ',directory,' removed' )

# list directry
print(os.listdir("C:/Users/VI40134538/Desktop/Numpy/"))

# opening file.......
my_file=open("C:/Users/VI40134538/Desktop/Numpy/test.txt")
print(my_file.read())
my_file.readline()           # read line by line
my_file.seek(0)              # bring pointer to start
my_file.close()               #close the file must thing

my_file=open("C:/Users/VI40134538/Desktop/Numpy/test.txt","w+")  # w+ is mentioned bcoz we are goona write the document
my_file.write("new")
my_file.writelines("new",'new2')
# r - read mode w - write mode a - append mode (it will add to last of old file or create new if file is not thr)



