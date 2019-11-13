#Python 3.4.3
#coding=gbk
# copy file  wangyuxia 20160920

import sys, shutil, os, string
path = "E:\\test for qgis\\"
target_path = "E:\\test for qgis\\HourScale\\"

for i in range(2,31):
    for j in range(0,24):
        filename = 'N'+str(i).zfill(2)+str(j).zfill(2)
        shutil.copyfile(path+'d_02.hdr',target_path+filename+'.hdr')
print("------------finished---------")
        
