import numpy as np
import math


a=np.random.randint(15,50,size=5)
b=np.random.randint(20,70,size=5)

print(a)
print(b)
c=a+b                                        # addition of vectors
print(c)
d=a.dot(b)
print(d)                                     # dot product of vectors
print(-math.inf)                             # to print inf value


from numpy.linalg import norm

x=np.array([1,2,3])
y=np.array([3,4])

a=norm(x)    #default is L2 norm
print(a)

l1_norm=norm(y,ord=1)                    # L1 norm
l2_norm=norm(y,ord=2)                    #L2 norm
l3_norm=norm(y,ord=3)                    #L3 norm

print(l1_norm)
print(l2_norm)
print(l3_norm)



