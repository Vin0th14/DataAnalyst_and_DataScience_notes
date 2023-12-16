import datetime

dir(datetime)

d = datetime.date(1947, 8, 15)
print(d)                                  # print the date

print(d.year)

print(d.month)

print(d.day)

s = datetime.date(2000, 1, 1)
dt = datetime.timedelta(100) # +ve nnumber increases the day and vice versa

print(s + dt)

x = datetime.date(1956, 1, 31)

print(x.strftime("%A, %B %d, %Y"))

launch_date = datetime.date(2017, 3, 30)
launch_time = datetime.time(22, 27, 0)
launch_date_time = datetime.datetime(2017, 3, 30, 22, 27, 0)

print(launch_date)
print(launch_time)
print(launch_date_time)

present = datetime.datetime.today()
print(present)

random_date = "7/20/1969"
datetime_obj = datetime.datetime.strptime(random_date, "%m/%d/%Y")    # convert string to date

print(datetime_obj)