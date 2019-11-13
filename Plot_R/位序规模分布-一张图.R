
#腾讯签到数据 春节前、春节时以及夜间灯管的位序规模分布图


library(ggplot2);library(grid);library(lattice)

setwd("E:\\TecentCheckIn\\study area new\\txt\\")

df = read.csv("del_spring.csv",header = TRUE)

df_before = df[order(df$SUM_bef_su,decreasing = TRUE),]

df_during = df[order(df$SUM_dur_su,decreasing = TRUE),]

df_light = df[order(df$light,decreasing = TRUE),]

ggplot(data=df_before,aes(x=log(c(1:2396)), y = log(df_before$SUM_bef_su)))+
  geom_point(size = 1.2,colour = "red")+
  geom_point(data=df_during,aes(x=log(c(1:2396)),y= log(df_during$SUM_dur_su)),size = 1.2,colour = "dark green")+
  geom_point(data=df_light,aes(x=log(c(1:2396)),y= log(df_light$light)),size = 1.2,colour = "orange")+
  labs(title="The size rank of the counties", x="Rank_log", y="Check in No._log")
  #theme(legend.position=c(0.11,0.84))
