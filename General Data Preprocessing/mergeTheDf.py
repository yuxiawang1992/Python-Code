
from pandas import DataFrame,Series
import pandas as pd
import numpy as np

path = "E:\\TecentCheckIn\\migration\\"
df_city = pd.read_table(path+'city_qq.txt',sep='\t',encoding = "utf-8")
df_migration_in = pd.read_table(path +'in.txt',sep='\t',encoding = "utf-8")
df_migration_out = pd.read_table(path +'out.txt',sep='\t',encoding = "utf-8")

df1 = pd.merge(df_city,df_migration_in,on='code')
df2 = pd.merge(df_city,df_migration_out,on='code')

df1.to_csv(path+'migration_in_name.csv')
df2.to_csv(path+'migration_out_name.csv')
