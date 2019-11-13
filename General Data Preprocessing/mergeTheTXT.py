
from pandas import DataFrame,Series
import pandas as pd
import numpy as np
import os

path = "E:\\test for qgis\\txt\\"
DF = DataFrame({'key':range(1,2942)},index=range(1,2942))

for file in os.listdir(path):
    df = pd.read_table(path+file,sep=",",names=['key',file[0:-4]])
    DF = pd.merge(DF,df,on='key')

DF.to_csv("E:\\test for qgis\\HourScale2.csv",index=False,header=True)


