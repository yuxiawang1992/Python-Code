
#绘制腾讯签到数据，春节前加春节时 24小时尺度的对比数据

#加载所需的包
library(ggplot2);library(grid);library(lattice)

#设置当前工作路径
setwd("E:\\TecentCheckIn\\TimeSeries\\Stratified Cluster\\")

#读取文件
data04 <- read.csv("HourScale_citys_04.csv",header = TRUE,sep=',')
data24 <- read.csv("HourScale_citys_24.csv",header = TRUE,sep=',')

#绘图并存储
a <- ggplot(data=data04,aes(x = data04$Hour, y = data04$Guangzhou))+
  geom_line(linetype = "solid",size = 1.2,colour = "dark green")+
  geom_line(data=data24,aes(x=data24$Hour,y=data24$Guangzhou),linetype = "dashed",size = 1.2,colour = "dark green")+
  scale_x_continuous(breaks=seq(2, 30, by = 4)) +
  #geom_point(size = 2, shape = 21, colour = "darkred", fill = "pink")+
  labs(title="Guangzhou", x="Day", y="Check in No.")
  
b <- ggplot(data=data04,aes(x = data04$Hour, y = data04$Chengdu))+
  geom_line(linetype = "solid",size = 1.2,colour = "#cea2fd")+
  geom_line(data=data24,aes(x=data24$Hour,y=data24$Chengdu),linetype = "dashed",size = 1.2,colour = "#cea2fd")+
  scale_x_continuous(breaks=seq(2, 30, by = 4)) +
  #geom_point(size = 2, shape = 21, colour = "darkred", fill = "pink")+
  labs(title="Chengdu", x="Day", y="Check in No.")

c <- ggplot(data=data04,aes(x = data04$Hour, y = data04$Wuhan))+
  geom_line(linetype = "solid",size = 1.2,colour = "#e51010")+
  geom_line(data=data24,aes(x=data24$Hour,y=data24$Wuhan),linetype = "dashed",size = 1.2,colour = "#e51010")+
  scale_x_continuous(breaks=seq(2, 30, by = 4)) +
  #geom_point(size = 2, shape = 21, colour = "darkred", fill = "pink")+
  labs(title="Wuhan", x="Day", y="Check in No.")

d <- ggplot(data=data04,aes(x = data04$Hour, y = data04$Changchun))+
  geom_line(linetype = "solid",size = 1.2,colour = "light green")+
  geom_line(data=data24,aes(x=data24$Hour,y=data24$Changchun),linetype = "dashed",size = 1.2,colour = "light green")+
  scale_x_continuous(breaks=seq(2, 30, by = 4)) +
  #geom_point(size = 2, shape = 21, colour = "darkred", fill = "pink")+
  labs(title="Changchun", x="Day", y="Check in No.")

e <- ggplot(data=data04,aes(x = data04$Hour, y = data04$Xiaogan))+
  geom_line(linetype = "solid",size = 1.2,colour = "orange")+
  geom_line(data=data24,aes(x=data24$Hour,y=data24$Xiaogan),linetype = "dashed",size = 1.2,colour = "orange")+
  scale_x_continuous(breaks=seq(2, 30, by = 4)) +
  #geom_point(size = 2, shape = 21, colour = "darkred", fill = "pink")+
  labs(title="Xiaogan", x="Day", y="Check in No.")

f <- ggplot(data=data04,aes(x = data04$Hour, y = data04$Huining))+
  geom_line(linetype = "solid",size = 1.2,colour = "#75bbfd")+
  geom_line(data=data24,aes(x=data24$Hour,y=data24$Huining),linetype = "dashed",size = 1.2,colour = "#75bbfd")+
  scale_x_continuous(breaks=seq(2, 30, by = 4)) +
  #geom_point(size = 2, shape = 21, colour = "darkred", fill = "pink")+
  labs(title="Huining", x="Day", y="Check in No.")

#新建绘图页面
grid.newpage()  ##新建页面
pushViewport(viewport(layout = grid.layout(3,2))) ##将页面分成2*1矩阵
vplayout <- function(x,y){
  viewport(layout.pos.row = x, layout.pos.col = y)
}

#输出绘图
print(a, vp = vplayout(1,1))   ###将（1,1)位置画图a
print(b, vp = vplayout(1,2))   ###将(1,2)的位置画图b
print(c, vp = vplayout(2,1))  ###将（2,1)的位置画图c
print(d, vp = vplayout(2,2))  ###将（2,1)的位置画图d
print(e, vp = vplayout(3,1))  ###将（2,1)的位置画图e
print(f, vp = vplayout(3,2))  ###将（2,1)的位置画图f

#dev.off() ##画下一幅图，记得关闭窗口
