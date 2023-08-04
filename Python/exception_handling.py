
try:
    print(2/0)  # it will show error for zero diviision
except:
    print("execued if any error found")

# 2 example...................
try:
    print(2/0)  # it will show error for zero diviision
except Exception as e:
    print("execued if any error found")
    print(e)  # it will print what the error is 

# 3 else and finally .........................

try:
    print(2/1)  # it will show error for zero diviision
except:
    print("execued if any error found")
else:
    print("it will print if no error is in try block")
finally:
    print("print no matter what")

# based on error type.................

try:
    print(2/0)  # it will show error for zero diviision
except ZeroDivisionError:
    print("Denominater should not be 0")
except NameError:
    print("..")
else:
    print("it will print if no error is in try block")
finally:
    print("print no matter what")


# raising error...................................................................
raise RuntimeError("Hi")

# defining new exception.....................................

class MySpecialError(ValueError):
    pass


try:
    print(2/1)  # it will show error for zero diviision
    raise MySpecialError("Helllo")
except MySpecialError:
    print("e....")



