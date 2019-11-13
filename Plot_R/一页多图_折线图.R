
# 绘制各个城市的时间变化曲线

#load the package
library(ggplot2);require(ggplot2);require(grid)

#设置当前工作路径
setwd("E:\\TecentCheckIn\\TimeSeries\\Stratified Cluster\\")

#读取文件
mydata <- read.csv("Citys_Dayscale.csv",header = TRUE,sep=',')

########新建画图页面###########
grid.newpage()  ##新建页面
pushViewport(viewport(layout = grid.layout(3,3))) ####将页面分成3*3矩阵
vplayout <- function(x,y){
  viewport(layout.pos.row = x, layout.pos.col = y)
}

#####现将图画好，并且赋值变量，储存######基函数:colour设置分组
a <- ggplot(data=mydata,aes(x = mydata$Date, y = mydata$Wuhan.District ))+
  geom_line(linetype = "solid",size = 1.2,colour = "dark green")+
  scale_x_continuous(breaks=seq(1, 29, by = 4)) +
  #geom_point(size = 2, shape = 21, colour = "darkred", fill = "pink")+
  labs(title="Wuhan District", x="Day", y="No. of mobile app users") +
  geom_vline(aes(xintercept=3), colour="purple", linetype="dashed")+
  geom_vline(aes(xintercept=23), colour="purple", linetype="dashed")+
  theme(plot.title = element_text(hjust = 0.5))  #加上这一行，标题居中

b <- ggplot(data=mydata,aes(x = mydata$Date, y = mydata$Taiyuan.District))+
  geom_line(linetype = "solid",size = 1.2,colour = "#cea2fd")+
  scale_x_continuous(breaks=seq(1, 29, by = 4)) +
  #geom_point(size = 2, shape = 21, colour = "darkred", fill = "pink")+
  labs(title="Taiyuan District", x="Day", y="No. of mobile app users") +
  geom_vline(aes(xintercept=3), colour="purple", linetype="dashed")+
  geom_vline(aes(xintercept=23), colour="purple", linetype="dashed")+
  theme(plot.title = element_text(hjust = 0.5))

c <- ggplot(data=mydata,aes(x = mydata$Date, y = mydata$Guangzhou.District))+
  geom_line(linetype = "solid",size = 1.2,colour = "#e51010")+
  scale_x_continuous(breaks=seq(1, 29, by = 4)) +
  #geom_point(size = 2, shape = 21, colour = "darkred", fill = "pink")+
  labs(title="Guangzhou District", x="Day", y="No. of mobile app users") +
  geom_vline(aes(xintercept=3), colour="purple", linetype="dashed")+
  geom_vline(aes(xintercept=23), colour="purple", linetype="dashed")+
  theme(plot.title = element_text(hjust = 0.5))

d <- ggplot(data=mydata,aes(x = mydata$Date, y = mydata$Huhehaote.Shi.District))+
  geom_line(linetype = "solid",size = 1.2,colour = "light green")+
  scale_x_continuous(breaks=seq(1, 29, by = 4)) +
  #geom_point(size = 2, shape = 21, colour = "darkred", fill = "pink")+
  labs(title="Huhehaote District", x="Day", y="No. of mobile app users") +
  geom_vline(aes(xintercept=3), colour="purple", linetype="dashed")+
  geom_vline(aes(xintercept=23), colour="purple", linetype="dashed")+
  theme(plot.title = element_text(hjust = 0.5))

e <- ggplot(data=mydata,aes(x = mydata$Date, y = mydata$Qianjiang.Shi))+
  geom_line(linetype = "solid",size = 1.2,colour = "orange")+
  scale_x_continuous(breaks=seq(1, 29, by = 4)) +
  #geom_point(size = 2, shape = 21, colour = "darkred", fill = "pink")+
  labs(title="Qianjiang City", x="Day", y="No. of mobile app users") +
  geom_vline(aes(xintercept=3), colour="purple", linetype="dashed")+
  geom_vline(aes(xintercept=23), colour="purple", linetype="dashed")+
  theme(plot.title = element_text(hjust = 0.5))

f <- ggplot(data=mydata,aes(x = mydata$Date, y = mydata$Changping.Xian))+
  geom_line(linetype = "solid",size = 1.2,colour = "#75bbfd")+
  scale_x_continuous(breaks=seq(1, 29, by = 4)) +
  #geom_point(size = 2, shape = 21, colour = "darkred", fill = "pink")+
  labs(title="Changping District", x="Day", y="No. of mobile app users") +
  geom_vline(aes(xintercept=3), colour="purple", linetype="dashed")+
  geom_vline(aes(xintercept=23), colour="purple", linetype="dashed")+
  theme(plot.title = element_text(hjust = 0.5))

g <- ggplot(data=mydata,aes(x = mydata$Date, y = mydata$Suizhong.Xian))+
  geom_line(linetype = "solid",size = 1.2,colour = "#dd3497")+
  scale_x_continuous(breaks=seq(1, 29, by = 4)) +
  #geom_point(size = 2, shape = 21, colour = "darkred", fill = "pink")+
  labs(title="Suizhong County", x="Day", y="No. of mobile app users") +
  geom_vline(aes(xintercept=3), colour="purple", linetype="dashed")+
  geom_vline(aes(xintercept=23), colour="purple", linetype="dashed")+
  theme(plot.title = element_text(hjust = 0.5))

h <- ggplot(data=mydata,aes(x = mydata$Date, y = mydata$Dongtou.Xian))+
  geom_line(linetype = "solid",size = 1.2,colour = "#2171b5")+
  scale_x_continuous(breaks=seq(1, 29, by = 4)) +
  #geom_point(size = 2, shape = 21, colour = "darkred", fill = "pink")+
  labs(title="Dongtou County", x="Day", y="No. of mobile app users") +
  geom_vline(aes(xintercept=3), colour="purple", linetype="dashed")+
  geom_vline(aes(xintercept=23), colour="purple", linetype="dashed")+
  theme(plot.title = element_text(hjust = 0.5))

i <- ggplot(data=mydata,aes(x = mydata$Date, y = mydata$Dujiangyan.Shi))+
  geom_line(linetype = "solid",size = 1.2,colour = "#fc4e2a")+
  scale_x_continuous(breaks=seq(1, 29, by = 4)) +
  #geom_point(size = 2, shape = 21, colour = "darkred", fill = "pink")+
  labs(title="Dujiangyan City", x="Day", y="No. of mobile app users") +
  geom_vline(aes(xintercept=3), colour="purple", linetype="dashed")+
  geom_vline(aes(xintercept=23), colour="purple", linetype="dashed")+
  theme(plot.title = element_text(hjust = 0.5))


print(a, vp = vplayout(1,1))   ###将（1,1)位置画图a
print(b, vp = vplayout(1,2))   ###将(1,2)的位置画图b
print(c, vp = vplayout(1,3))  ###将（1,3)的位置画图c
print(d, vp = vplayout(2,1))  ###将（2,1)的位置画图d
print(e, vp = vplayout(2,2))  ###将（2,2)的位置画图e
print(f, vp = vplayout(2,3))  ###将（2,3)的位置画图f
print(g, vp = vplayout(3,1))  ###将（3,1)的位置画图g
print(h, vp = vplayout(3,2))  ###将（3,2)的位置画图h
print(i, vp = vplayout(3,3))  ###将（3,3)的位置画图i


#dev.off() ##画下一幅图，记得关闭窗口