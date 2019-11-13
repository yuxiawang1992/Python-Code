
#绘制腾讯签到数据，春节前加春节时 24小时尺度的对比数据

#加载所需的包
library(ggplot2);library(grid);library(lattice)

#设置当前工作路径
setwd("E:\\TecentCheckIn\\TimeSeries\\Stratified Cluster\\")

#读取文件
data04 <- read.csv("City-Before Spring Festival.csv",header = TRUE,sep=',')
data24 <- read.csv("City-During Spring Festival.csv",header = TRUE,sep=',')

#绘图并存储
a <- ggplot(NULL)+
  geom_line(data=data04,aes(x=data04$Hour,y=data04$Wuhan.district,linetype = "BeforeSF"),colour = "dark green",size = 1.2)+
  geom_line(data=data24,aes(x=data24$Hour,y=data24$Wuhan.district,linetype = "DuringSF"),colour = "dark green",size = 1.2)+
  scale_x_continuous(breaks=seq(1, 23, by = 3)) +
  labs(title="Wuhan District", x="Hour", y="No. of mobile app users")+
  scale_colour_manual(values = c("BeforeSF"="solid","DuringSF"="dashed"),breaks = c("BeforeSF", "DuringSF"))+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(legend.position="top")

b <- ggplot(NULL)+
  geom_line(data=data04,aes(x=data04$Hour,y=data04$Taiyuan.district,linetype = "BeforeSF"),size = 1.2,colour = "#cea2fd")+
  geom_line(data=data24,aes(x=data24$Hour,y=data24$Taiyuan.district,linetype = "DuringSF"),size = 1.2,colour = "#cea2fd")+
  scale_x_continuous(breaks=seq(1, 23, by = 3)) +
  scale_colour_manual(values = c("BeforeSF"="solid","DuringSF"="dashed"),breaks = c("BeforeSF", "DuringSF"))+
  labs(title="Taiyuan District", x="Hour", y="No. of mobile app users")+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(legend.position="top")

c <- ggplot(NULL)+
  geom_line(data=data04,aes(x=data04$Hour,y = data04$Guangzhou.district,linetype = "BeforeSF"),size = 1.2,colour = "#e51010")+
  geom_line(data=data24,aes(x=data24$Hour,y=data24$Guangzhou.district,linetype = "DuringSF"),size = 1.2,colour = "#e51010")+
  scale_x_continuous(breaks=seq(1, 23, by = 3)) +
  scale_colour_manual(values = c("BeforeSF"="solid","DuringSF"="dashed"),breaks = c("BeforeSF", "DuringSF"))+
  labs(title="Guangzhou District", x="Hour", y="No. of mobile app users")+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(legend.position="top")

d <- ggplot(NULL)+
  geom_line(data=data04,aes(x = data04$Hour, y = data04$Huhehaote.district,linetype = "BeforeSF"),size = 1.2,colour = "light green")+
  geom_line(data=data24,aes(x=data24$Hour,y=data24$Huhehaote.district,linetype = "DuringSF"),size = 1.2,colour = "light green")+
  scale_x_continuous(breaks=seq(1, 23, by = 3)) +
  scale_colour_manual(values = c("BeforeSF"="solid","DuringSF"="dashed"),breaks = c("BeforeSF", "DuringSF"))+
  labs(title="Huhehaote District", x="Hour", y="No. of mobile app users")+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(legend.position="top")

e <- ggplot(NULL)+
  geom_line(data=data04,aes(x = data04$Hour, y = data04$Qianjiang.city,linetype = "BeforeSF"),size = 1.2,colour = "orange")+
  geom_line(data=data24,aes(x=data24$Hour,y=data24$Qianjiang.city,linetype = "DuringSF"),size = 1.2,colour = "orange")+
  scale_x_continuous(breaks=seq(1,23,by=3)) +
  scale_colour_manual(values = c("BeforeSF"="solid","DuringSF"="dashed"),breaks = c("BeforeSF", "DuringSF"))+
  labs(title="Qianjiang City", x="Hour", y="No. of mobile app users")+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(legend.position="top")

f <- ggplot(NULL)+
  geom_line(data=data04,aes(x = data04$Hour, y = data04$Changping.county,linetype = "BeforeSF"),size = 1.2,colour = "#75bbfd")+
  geom_line(data=data24,aes(x=data24$Hour,y=data24$Changping.county,linetype = "DuringSF"),size = 1.2,colour = "#75bbfd")+
  scale_x_continuous(breaks=seq(1, 23, by = 3)) +
  scale_colour_manual(values = c("BeforeSF"="solid","DuringSF"="dashed"),breaks = c("BeforeSF", "DuringSF"))+
  labs(title="Changping District", x="Hour", y="No. of mobile app users")+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(legend.position="top")

g <- ggplot(NULL)+
  geom_line(data=data04,aes(x = data04$Hour, y = data04$Suizhong.county,linetype = "BeforeSF"),size = 1.2,colour = "#dd3497")+
  geom_line(data=data24,aes(x=data24$Hour,y=data24$Suizhong.county,linetype = "DuringSF"),size = 1.2,colour = "#dd3497")+
  scale_x_continuous(breaks=seq(1, 23, by = 3)) +
  labs(title="Suizhong County", x="Hour", y="No. of mobile app users")+
  scale_colour_manual(values = c("BeforeSF"="solid","DuringSF"="dashed"),breaks = c("BeforeSF", "DuringSF"))+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(legend.position="top")

h <- ggplot(NULL)+
  geom_line(data=data04,aes(x = data04$Hour, y = data04$Dongtou.county,linetype = "BeforeSF"),size = 1.2,colour = "#2171b5")+
  geom_line(data=data24,aes(x=data24$Hour,y=data24$Dongtou.county,linetype = "DuringSF"),size = 1.2,colour = "#2171b5")+
  scale_x_continuous(breaks=seq(1, 23, by = 3)) +
  scale_colour_manual(values = c("BeforeSF"="solid","DuringSF"="dashed"),breaks = c("BeforeSF", "DuringSF"))+
  labs(title="Dongtou County", x="Hour", y="No. of mobile app users")+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(legend.position="top")

i <- ggplot(NULL)+
  geom_line(data=data04,aes(x = data04$Hour, y = data04$Dujiangyan.city,linetype = "BeforeSF"),size = 1.2,colour = "#fc4e2a")+
  geom_line(data=data24,aes(x=data24$Hour,y=data24$Dujiangyan.city,linetype = "DuringSF"),size = 1.2,colour = "#fc4e2a")+
  scale_x_continuous(breaks=seq(1, 23, by = 3)) +
  scale_colour_manual(values = c("BeforeSF"="solid","DuringSF"="dashed"),breaks = c("BeforeSF", "DuringSF"))+
  labs(title="Dujiangyan City", x="Hour", y="No. of mobile app users")+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(legend.position="top")


#新建绘图页面
grid.newpage()  ##新建页面
pushViewport(viewport(layout = grid.layout(3,3))) ##将页面分成2*1矩阵
vplayout <- function(x,y){
  viewport(layout.pos.row = x, layout.pos.col = y)
}

#输出绘图


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
