
########lines

#加载所需的包
library(ggplot2); library(scales); library(grid); library(RColorBrewer)
library(reshape2)

#设置当前工作路径
setwd("C:\\Users\\dell\\Desktop\\plot\\")

#读取文件
data <- read.csv("DayScale_citys.csv",header = TRUE,sep=',')
melt_data <- melt(data,id.vars="Date")

#基函数:colour设置分组
ggplot(melt_data,aes(x = Date, y = value))+
  #折线函数:linetype设置线形
  geom_line(aes(color=variable),size = 1)+
  scale_x_continuous(breaks=seq( 5, 15, by = 1)) +
  scale_y_continuous(labels=comma) +
  geom_point(size = 2, shape = 21, colour = "darkred", fill = "pink")+
  theme_grey()+
  labs(title="Distribution of fitness values", x="No.of hospitals to be relocated (P)", y="Fitness value") 

  

