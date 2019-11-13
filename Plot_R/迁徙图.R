
#加载recharts包
library(recharts)

#设置当前工作路径
setwd("E:\\TecentCheckIn\\Migration\\")

#load the data
migration_data <- read.csv("in_name_01.csv",header = TRUE,as.is = TRUE)
# 给数据重新命名列名
names(migration_data) <- c('id','date','flow_in_city','flow_out_city',
                           'flow_value','car_ratio','train_ratio','flight_ratio')

target <- data.frame(name1= migration_data$flow_out_city,name2=migration_data$flow_in_city,
                     value = migration_data$flow_value, stringsAsFactors = FALSE)

#使用geocode函数可以通过google获得获得默认的WGS84的坐标
#若用于Echarts，需用convWGS2BD函数或geocode (ocs=‘BD-09’) 转为BD-09坐标。
geocode <- geocode(migration_data$out_city[155], api='google')
  
#coord <- convWGS2BD(geocode(migration_data$out_city, api='google'))
#coord$name <- migration_data$out_city

#series column mapping series of addML/addMP
target$series <- paste0(target$out_city, 'Top10')

#plot addGeoCoord(coord) %>%
g <- echartr(NULL, type='map_china') %>% setTitle('China Map') %>% 
  addML(series=1, data=target, symbol=c('none', 'circle'), symbolSize=1,
        smooth=TRUE, itemStyle=list(normal=itemStyle(
        color='#fff', borderWidth=1, borderColor='rgba(30,144,255,0.5)')))

g <- g %>% setSeries(hoverable=FALSE, itemStyle=list(
  normal=itemStyle(
    borderColor='rgba(100,149,237,1)', borderWidth=0.5, 
    areaStyle=areaStyle(color='#1b1b1b'))
))
g

