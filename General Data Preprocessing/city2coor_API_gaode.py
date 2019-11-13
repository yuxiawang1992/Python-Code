# -*- coding: utf-8 -*-
"""
Created on Sun Jan 08 10:49:07 2017

@author: dell

利用腾讯地图API获取的城市GCJ-02坐标，进行城市名称的//WGS84坐标、BD-09坐标系//获取
获取的腾讯地图开发的 key：5fe88722cc387c6d30dd4a117a609ade

"""
import sys
reload(sys)
sys.setdefaultencoding('utf8')

from coordTransform_utils import gcj02tobd09
from coordTransform_utils import gcj02towgs84

path = "E:\\TecentCheckIn\\Migration\\"

fout = open(path+'city_qq_coord_all.txt','w')
fout.write("city_name,gcj02_lng,gcj02_lat,ba09_lng,bd09_lat,wgs84_lng,wgs84_lat"+'\n')

city = open(path+"city_qq_coord_gcj02.txt")
lines = city.readlines()
for i in range(1,len(lines)):
    data = lines[i].strip().split('\t')    
    city_name = data[0]
    gcj02_lng,gcj02_lat = map(lambda x: float(x),data[1:3])
    print('-----------'+city_name+'---------------')
    bd09_lng,bd09_lat = gcj02tobd09(gcj02_lng,gcj02_lat)
    wgs84_lng,wgs84_lat = gcj02towgs84(gcj02_lng,gcj02_lat)
    
    fout.write(city_name+','+str(gcj02_lng)+','+str(gcj02_lat)+','+str(bd09_lng)+','+str(bd09_lat)+','+str(wgs84_lng)+','+str(wgs84_lat)+'\n')
    
    
fout.close()
city.close()
    
    

