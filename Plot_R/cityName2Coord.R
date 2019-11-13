
#����recharts��
library(recharts)

#���õ�ǰ����·��
setwd("C:\\Users\\dell\\Desktop\\plot\\")

#load the data
data <- read.csv("migration_out_city_0101.csv",header = TRUE,as.is = TRUE)

#ʹ��geocode��������ͨ��google��û��Ĭ�ϵ�WGS84�����꣬������Echarts������convWGS2BD������geocode (ocs=��BD-09��) תΪBD-09���ꡣ

coor <- c(geocode(data$Ǩ����[1], api='google'))
city_name <- c(data$Ǩ����[1])

for (i in 2:length(data$Ǩ����)){
  temp <- convWGS2BD(geocode(data$Ǩ����[i], api='google'))
  if(!is.na(temp))
  {
    coor <- c(coor,temp )
    city_name <- c( city_name, data$Ǩ����[i] )
  }
  else
  {
    temp <- convWGS2BD(geocode(data$Ǩ����[i], api='google'))
    coor <- c( coor,temp )
    city_name <- c( city_name, data$Ǩ����[i] )
  }
  
}

df <- data.frame(city_name,coor$lng,coor$lat)
write.csv(df,file = 'city_encoding.csv')