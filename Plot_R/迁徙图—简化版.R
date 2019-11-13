
# 将签到数据设计的城市的WGS-84坐标的数据  利用echarts转换为百度坐标系

#加载recharts包
library(recharts);library(devtools);library(REmap)
#设置当前工作路径
setwd("E:\\TecentCheckIn\\Migration\\")

#load the data
migration_data_in <- read.csv("in_name_01.csv",header = TRUE,as.is = TRUE)
migration_data_out <- read.csv("out_name_01.csv",header = TRUE,as.is = TRUE)

from_beijing <- migration_data_in[migration_data_in$flow_out_city == '上海',]

origin = from_beijing$flow_out_city
destination = from_beijing$flow_in_city

dat = data.frame(origin,destination)
out = remap(dat,title = "北京作为最大输入源的城市",subtitle = "2016-01-01",
            theme = get_theme("None",lineColor = "orange",backgroundColor = "#FFFFFF",
                              titleColor = "#1b1b1b",regionColor = '#ADD8E6'))

plot(out)
