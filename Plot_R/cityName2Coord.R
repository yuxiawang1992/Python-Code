
#加载recharts包
library(recharts)

#设置当前工作路径
setwd("C:\\Users\\dell\\Desktop\\plot\\")

#load the data
data <- read.csv("migration_out_city_0101.csv",header = TRUE,as.is = TRUE)

#使用geocode函数可以通过google获得获得默认的WGS84的坐标，若用于Echarts，需用convWGS2BD函数或geocode (ocs=‘BD-09’) 转为BD-09坐标。

coor <- c(geocode(data$迁出市[1], api='google'))
city_name <- c(data$迁出市[1])

for (i in 2:length(data$迁出市)){
  temp <- convWGS2BD(geocode(data$迁出市[i], api='google'))
  if(!is.na(temp))
  {
    coor <- c(coor,temp )
    city_name <- c( city_name, data$迁出市[i] )
  }
  else
  {
    temp <- convWGS2BD(geocode(data$迁出市[i], api='google'))
    coor <- c( coor,temp )
    city_name <- c( city_name, data$迁出市[i] )
  }
  
}

df <- data.frame(city_name,coor$lng,coor$lat)
write.csv(df,file = 'city_encoding.csv')