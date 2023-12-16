import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

data = pd.DataFrame({
    "Values": [5,5,5] + [50]*25 + [100, 89]
})
data

plt.hist(data["Values"])
plt.show()

lower_bound = 0.1
upper_bound = 0.95

result = data["Values"].quantile([lower_bound, upper_bound])
print(result)

outliers_mask = (data["Values"]<result[lower_bound]) | (data["Values"]>result[upper_bound])  # identyfying outlier
data[outliers_mask]

data[outliers_mask] = data[~outliers_mask].median()["Values"]            # imputing values with median

plt.hist(data["Values"])
plt.show()