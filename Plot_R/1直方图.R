
#绘制直方图

# load necessary packages
library(ggplot2)
# set current working directory
setwd("E:\\TecentCheckIn\\Economics\\GWR\\GWR_new\\结果\\")
#read the dataframe
df <- read.csv("tp+pi+st+tpt_listwise.csv",header = TRUE,sep = ',')
attach(df)
#plot
p <- ggplot(data = df, aes(x = std_residual, y = ..densitys..))+
  geom_histogram(binwidth = 0.1,colour = "grey80",fill = "orange")+
  geom_density( fill = "light blue",colour = "green", size= 1,alpha = 0.3)+
  labs(x = "standard residual")
  #labs(title = "Standard residual distribution histogram")+
  theme(plot.title = element_text(hjust = 0.5))

p