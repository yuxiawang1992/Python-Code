
# 绘制腾讯签到数据29天变化的 各个聚类结果的曲线图

# load required packages
library(GGally);library(ggplot2);library(grid);library(lattice);

#set current working directory
setwd("E:\\TecentCheckIn\\TimeSeries\\Stratified Cluster\\")

#read data
df <- read.csv("Data_Cluster_Plot.csv",header = TRUE,sep=',')
df[,4] <- as.factor( df[,4])

# rename the cols
colnames(df)[6:34]<-paste("D",1:29,sep="")

# plot the overall data
cluster_plot <- ggparcoord(df,columns = c(6:34),groupColumn = 4, showPoints = TRUE,alphaLines = 0.3) + 
  labs(x="Time period: 2016.1.16 -- 2016.2.13",y="")+
  labs(y = "Z-score standardization value")+
  geom_vline(aes(xintercept=3), colour="purple", linetype="dashed")+
  geom_vline(aes(xintercept=23), colour="purple", linetype="dashed")


cluster_plot


# #########未采用
# #新建绘图页面
# grid.newpage()  ##新建页面
# pushViewport(viewport(layout = grid.layout(5,6))) ##将页面分成6*6矩阵
# vplayout <- function(x,y){
#   viewport(layout.pos.row = x, layout.pos.col = y)
# }
# 
# df_new <- (df[df$QCL == 5,])
# df_mean <- apply(df_new[,6:34],2,mean)
# 
# for (i in 1:10)
# {
#   df_new <- (df[df$QCL == i,])
#   df_mean <- apply(df_new[,6:34],2,mean)
#   cluster_plot <- ggparcoord(df_1,columns = c(6:34)) + 
#     geom_line(color = "orange",size=1,alpha=1)
# }
# 
# ggparcoord(mtcars,columns = c(1,5:10)) + 
#   geom_line(color = "orange",size=1,alpha=1)
# #######