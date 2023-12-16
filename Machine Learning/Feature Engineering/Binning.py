import pandas as pd          # Binning or grouping

data = pd.read_csv(r"E:/DataScience_and_DataAnalyst_Notes/Machine Learning/Feature Engineering/dataset _ files/StudentsPerformance.csv", usecols=["gender", "math score"])
print(data.head())

bins = [0, 25, 50, 75, 100]

# define the bin names
bin_names = ["Fail", "Average", "Good", "Brilliant"]

data["Grades"] = pd.cut(data["math score"], bins = bins, labels = bin_names)

print(data.head())