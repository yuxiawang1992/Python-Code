
#腾讯签到数据 春节前、春节时以及夜间灯管的位序规模分布图


library(ggplot2);library(grid);library(lattice)

setwd("E:\\TecentCheckIn\\study area new\\txt\\")

df = read.csv("del_spring.csv",header = TRUE)

df_before = df[order(df$SUM_bef_su,decreasing = TRUE),]

df_during = df[order(df$SUM_dur_su,decreasing = TRUE),]

df_light = df[order(df$light,decreasing = TRUE),]

before <- ggplot(data=df_before,aes(x=log(c(1:2396)), y = log(df_before$SUM_bef_su)))+
  geom_point(size = 1.2,colour = "red")+
  labs(title="Before the Spring", x="Rank_log", y="Check in No._log")

during <- ggplot(data=df_during,aes(x=log(c(1:2396)),y= log(df_during$SUM_dur_su)))+
  geom_point(size = 1.2,colour = "dark green")+
  labs(title="During the Spring", x="Rank_log", y="Check in No._log")

light <- ggplot(data=df_light,aes(x=log(c(1:2396)),y= log(df_light$light)))+
  geom_point(size = 1.2,colour = "orange")+
  labs(title="The night light", x="Rank_log", y="Night value_log")

#新建绘图页面
grid.newpage()  ##新建页面
pushViewport(viewport(layout = grid.layout(3,1))) ##将页面分成3*1矩阵
vplayout <- function(x,y){
  viewport(layout.pos.row = x, layout.pos.col = y)
}

#输出绘图
print(before, vp = vplayout(1,1))   ###将（1,1)位置画图a
print(during, vp = vplayout(2,1))  ###将（2,1)的位置画图c
print(light, vp = vplayout(3,1))  ###将（2,1)的位置画图e
