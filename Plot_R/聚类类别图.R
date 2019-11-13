
# 绘制腾讯签到数据29天变化的 9个聚类结果的曲线图

# load required packages
library(GGally);library(ggplot2);library(grid);library(lattice);

#set current working directory
setwd("E:\\TecentCheckIn\\TimeSeries\\Stratified Cluster\\")

#read data
df <- read.csv("coordinate_plot 0314.csv",header = TRUE,sep=',')

cluster <- c("1","2","3","4","5","6","7","8","9")

#data split
df_cluster <- (df[df$QCL == cluster[3],])
mean_cluster <- apply(df_cluster[3:31],2,median)
mean_cluster <- t(c(3000,10,mean_cluster))
# rename the cols
colnames(mean_cluster)[1:2] <- c("fid","QCL")
#使用cbind函数将均值添加到最后一列
df_cluster <- rbind(df_cluster[1:nrow(df_cluster), ] , mean_cluster)
df_cluster[,2] <- as.factor( df_cluster[,2])

# plot the overall data
cluster_plot <- ggparcoord(df_cluster,columns = c(3:31),groupColumn = 2,  boxplot = TRUE, showPoints = TRUE,alphaLines = 0.3) + 
  labs(x="",y="")+
  geom_vline(aes(xintercept=3), colour="purple", linetype="dashed")+
  geom_vline(aes(xintercept=23), colour="purple", linetype="dashed")


cluster_plot

#新建绘图页面
grid.newpage()  ##新建页面
pushViewport(viewport(layout = grid.layout(3,3))) ##将页面分成3*3矩阵
vplayout <- function(x,y){
  viewport(layout.pos.row = x, layout.pos.col = y)
}


  