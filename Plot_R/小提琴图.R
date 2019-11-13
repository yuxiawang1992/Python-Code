
# 绘制腾讯签到数据29天变化的 各个聚类结果的曲线图

# load required packages
library(GGally);library(ggplot2);library(grid);library(lattice);

#set current working directory
setwd("E:\\TecentCheckIn\\TimeSeries\\Stratified Cluster\\")

#read data
df <- read.csv("Data_Cluster_Plot.csv",header = TRUE,sep=',')
df[,4] <- as.factor( df[,4])
df[,6:34] <- log(df[,6:34])
# rename the cols
colnames(df)[6:34]<-paste("D",1:29,sep="")

p.violin <- ggplot(df) + 
  geom_violin(aes(x=QCL, y=D23,color=QCL,fill=QCL,alpha=0.3),show.legend = TRUE,size=1,scale="width")+
  geom_boxplot(aes(x=QCL, y=D23,color=QCL,fill=QCL,alpha=0.3),width = .1, outlier.colour = NA)+
  stat_summary(aes(x=QCL, y=D23,color=QCL),fun.y="median", geom="point", shape=23, size=1, fill="white")+
  labs(x="Cluster",y="New Year's Eve")

p.violin