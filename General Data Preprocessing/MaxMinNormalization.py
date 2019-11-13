'''
最大最小标准化
'''
import pandas as pd

path = "E:\\TecentCheckIn\\TimeSeries\\Stratified Cluster\\"
df = pd.read_table(path+"Day_800k.csv",sep=",")
new_df = df.drop('code_90',axis=1,inplace = False)
print(new_df.head())
#最大最小标准化
row_min = new_df.max(axis=1)
row_max = new_df.min(axis=1)

f = lambda x: (x - x.min())/ (x.max() - x.min())
nor_df = new_df.apply(f,axis=0)
print(nor_df.head())

nor_df.to_csv("E:\\TecentCheckIn\\TimeSeries\\Stratified Cluster\\Nor_Day_800k.csv",index = False,header=True)

