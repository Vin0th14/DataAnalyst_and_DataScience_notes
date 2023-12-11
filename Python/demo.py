ending_value=10

def prime(n):
    result=True
    for i in range(2,n+1):
        for j in range(2,i):
            if i%2==0:
                result=True
            else:
                result=False
        if result==True:
            print("it is not prime")
        else:
            print('it is prime')

print(prime(9))
                

