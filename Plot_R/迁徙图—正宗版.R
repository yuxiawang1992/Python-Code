
# 针对腾讯签到的367个迁出数据，进行迁徙图绘制

#加载recharts包
library(recharts)
#设置当前工作路径
setwd("E:\\TecentCheckIn\\Migration\\")

#load the data
migration_data_out <- read.csv("out_name_01.csv",header = TRUE,as.is = TRUE)
migration_data_out <- migration_data_out[,-(6:8)]
migration_data_out <- migration_data_out[,-(1:2)]
names(migration_data_out) <- c('name1','name2','value')

city_qq_coord <-  read.csv("city_qq_coord_all.csv",header = TRUE,as.is = TRUE)
city_qq_coord <- city_qq_coord[,-(2:3)]
city_qq_coord <- city_qq_coord[,-(4:5)]

p.migration <- echartr(NULL,type='map_china') %>%
  addML(series='北京',data =migration_data_out[migration_data_out$name2=="北京",]) %>%
  addML(series='上海',data =migration_data_out[migration_data_out$nmae2=="上海",])
  
p.migration %>% addGeoCoord(city_qq_coord)

p.migration 

