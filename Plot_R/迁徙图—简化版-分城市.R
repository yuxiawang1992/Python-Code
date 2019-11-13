
# 分城市绘制其迁出量的前十名，以北京市为例

#加载recharts包
library(recharts);library(devtools);library(REmap)
#设置当前工作路径
setwd("E:\\TecentCheckIn\\Migration\\top10\\out\\")

#load the data
data <- read.csv("110000_北京.txt",header = FALSE,sep = ",",fileEncoding = "utf-8",as.is = TRUE)

origin = rep('北京',10)
destination = data$V1

dat = data.frame(origin,destination)
out = remap(dat,title = "北京迁出Top10",subtitle = "2016-01-01",
            theme = get_theme("None",lineColor = "orange",backgroundColor = "#FFFFFF",
                              titleColor = "#1b1b1b",regionColor = '#ADD8E6'))

plot(out)
