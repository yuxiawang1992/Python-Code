
#load the package
library(lattice);library(ggplot2)

#设置当前工作路径
setwd("E:\\TecentCheckIn\\TimeSeries\\Stratified Cluster\\")

#load the data
data <- read.csv("coordinate_plot 0314.csv",header = TRUE,sep=',')

#plot
mycolors <- rainbow(9)

parallelplot(~data[3:31], data, groups = QCL, aspect = "fill",
             horizontal.axis = FALSE, scales = list(x = list(rot = 0)))