
#绘制累积频率分布曲线

# load necessary packages
library(ggplot2)
# set current working directory
setwd("E:\\TecentCheckIn\\TimeSeries\\Stratified Cluster\\")
#read the dataframe
df <- read.csv("分层-排名百分比.csv",header = TRUE,sep = ',')

#plot
p <- ggplot(data = df)+
  geom_point(aes(x = df$列1, y = df$百分比),colour = "sky blue") +
  geom_vline(aes(xintercept=800000), colour="purple", linetype="dashed")+
  geom_vline(aes(xintercept=2000000), colour="purple", linetype="dashed")+
  labs(title = "Ordinal and percentage rank", x = "mobile app user number", y = "percentage")+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_x_continuous(breaks = seq(8e+5,3e+6,1.2e+6))

p