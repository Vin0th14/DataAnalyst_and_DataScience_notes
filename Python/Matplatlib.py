import matplotlib.pyplot as plt
import numpy as np

#Functional method
#1 Simple plotting using matplotlib ......................................................................
a=np.linspace(0,5,11)
b=a ** 2
print(b)
plt.plot(a,b)
plt.xlabel("X label")                        #Labelling X and Y axis and titles
plt.ylabel('Y label')
plt.title('Matplotlib')
plt.show()                                   #used to print the diagram 

#2 Creating Subplot..........................................................................
plt.subplot(1,2,1)                  #(no of rows , no of columns , plot number)
plt.plot(a,b,'r')

plt.subplot(1,2,2)                  #(no of rows , no of columns , plot number)
plt.plot(b,a,'b')

plt.show()

#Object oriented method

fig = plt.figure()
axes = fig.add_axes([0.1,0.1,0.8,0.8])  #[left,bottom,width,height]
axes.plot(a,b,'r')
axes.set_xlabel("X label")            #Labelling X and Y axis and titles
axes.set_ylabel("y label")
plt.show()

# Object oriented method to plot is more usefull because of this


#Method 1
fig = plt.figure()                              #Created figure with x axis y axis and height and widht
axes1 = fig.add_axes([0.1,0.1,0.8,0.8])         
axes2 = fig.add_axes([0.2,0.5,0.3,0.3])         #Creating smaller one inside bigger graph
axes1.plot(a,b)
axes2.plot(b,a)
axes1.set_title("large")
axes2.set_title("small")
#plt.show()


#method 2
#alternate and easy method for above steps

fig,axes = plt.subplots(1,2,figsize=(8,2))         #(no of rows ,no of colums , figure size)
axes[0].plot(a,b)                    # we can plot using indexing
axes[1].plot(b,a) 
plt.tight_layout()                  #prevent overlapping

# fig.savefig("My_pic.jpg")          To save the figure

fig = plt.figure()
axes = fig.add_axes([0.2,0.2,1,1])  #[left,bottom,width,height]
axes.plot(a,a**2,label='Square')    #adding label so that it will help legend to identify
axes.plot(a,a**3,label='Cube')
axes.legend(loc=0)             #to Show legend of diagram (location of legend in diagram 0=best , 10 =center)

fig = plt.figure()
axes = fig.add_axes([0.1,0.1,0.8,0.8])  #[left,bottom,width,height]
axes.plot(a,b,'r',lw=1,alpha=0.5,ls='-',marker='o')    #( , ,color,width of line,transperancy,line style,marks intersecting point)
        #for market there are lot of customization (markersize= ,markerfacecolor='',markeredgewidth= ,markeredgecolor='')

fig = plt.figure()
axes = fig.add_axes([0.1,0.1,0.8,0.8])  #[left,bottom,width,height]
axes.plot(a,b,'r')
axes.set_xlim([0,1])                   #to see the graph specific between 0 and 1 in x axis
axes.set_ylim([0,2])
plt.show()





