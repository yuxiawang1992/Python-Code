# -*- coding: utf-8 -*-
"""
Created on Sat Jan 07 12:52:53 2017

@author: dell

简单测试调用腾讯地图API，进行城市名称的//WGS84坐标//获取  //默认使用的还是GCJ-02坐标

获取的腾讯地图开发的 key：NPRBZ-IJDCJ-NEIFO-KDXFA-B7YRH-OMFVW
"""

import urllib
import urllib2
import json
import time

import sys
reload(sys)
sys.setdefaultencoding('utf8')

path = "E:\\TecentCheckIn\\Migration\\"

city = open(path+"city_qq.txt")

fout = open(path+'city_qq_coor.txt','w')
fout.write("city_name,status,lng,lat,province,city,deviation,reliability"+'\n')
lines = city.readlines()
for i in range(1,len(lines)):
    data = lines[i].strip().split('\t')
    city_name = data[0]
    print('-----------'+city_name+'---------------')
    #要请求的url地址
    url = 'http://apis.map.qq.com/ws/geocoder/v1/'
    # 根据API提供的参数，将需要获取的参数放在dictionary中
    data={'address':city_name,'key':'NPRBZ-IJDCJ-NEIFO-KDXFA-B7YRH-OMFVW'}
    #把参数进行url编码
    data = urllib.urlencode(data)
    """
    POST请求
    # 用.Request来发送POST请求，指明请求目标是之前定义过的url，请求内容放在data里
    url2 = urllib2.Request(url,data) 
    """
    #GET请求
    # 跟post不同的只有这一句，使用?把url和data的内容连接起来，结果是https://api.douban.com/v2/book/user/ahbei/collections?status=read&rating=3&tag=%E5%B0%8F%E8%AF%B4
    url2 = url + '?' + data
    # 用.urlopen打开上一步返回的结果，得到请求后的响应内容
    response = urllib2.urlopen(url2)
    
    #将响应内容用read()读取出来
    apicontent = response.read()
    
    myjson = json.loads(apicontent)
    
    status = myjson['status']
    print(status)
    if (status == 0):
        lng = myjson['result']['location']['lng']
        lat = myjson['result']['location']['lat']
        province = myjson['result']['address_components']['province']
        city = myjson['result']['address_components']['city']
        deviation = myjson['result']['similarity']
        reliability = myjson['result']['reliability']
        
        fout.write(city_name+','+str(status)+','+str(lng)+','+str(lat)+','+province+','+city+','+str(deviation)+','+str(reliability)+'\n')
     
    time.sleep(8)

fout.close()
