
# 绘制腾讯签到数据差值 在各个解释变量上的变化

# load required packages
library(GGally);library(ggplot2);library(grid);library(lattice);

#set current working directory
setwd("E:\\TecentCheckIn\\TimeSeries\\Stratified Cluster\\")

#read data
df <- read.csv("coordinate_plot 0314.csv",header = TRUE,sep=',')

#df[,4] <- as.factor( df[,8])

# rename the cols
#colnames(df)[6:34]<-paste("D",1:29,sep="")

# plot the overall data
cluster_plot <- ggparcoord(df,columns = c(3:31),groupColumn = 2, 
                           showPoints = TRUE,alphaLines = 0.5)


cluster_plot