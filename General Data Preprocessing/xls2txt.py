# Python 3.4.3
# -*- coding:utf-8 -*-
'''
convert the xls format file to csv 
'''

import pandas as pd
import os

path = "C:\\Users\\dell\\Desktop\\yuyu\\"
txt_path = "C:\\Users\\dell\\Desktop\\yuyu2\\"

for file in os.listdir(path):
    data_xls = pd.read_excel(path+file,index_col=None,names =['x','z','y']) 
    f1 = open(txt_path+file[0:-4]+'.txt','w')
    for i in range(len(data_xls['x'])):
        f1.write(str(data_xls['x'][i])+'\t'+str(data_xls['y'][i])+'\t'+str(data_xls['z'][i])+';')
    print("------finished-----"+file)
    f1.close()
print("-----all done-----")
            

