#coding=utf-8  
  
import os
path = "E:\\test for qgis\\Hourly\\新建文件夹\\"
count = 0
for file in os.listdir(path):
    name = str(count).zfill(2) # 前面补零
    os.rename(os.path.join(path,file),os.path.join(path, "H_"+name+".hdr"))
    count += 1