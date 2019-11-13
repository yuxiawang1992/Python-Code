
#绘制累积频率分布曲线

# load necessary packages
library(ggplot2)
# set current working directory
setwd("E:\\TecentCheckIn\\TimeSeries\\Stratified Cluster\\")
#read the dataframe
df <- read.csv("分层聚类标准.csv",header = TRUE,sep = ',')

attach(df)
len <- dim(df)[1]
ssal <- c()
slen <- sum(number)
ssal[1] <- number[1]/slen
for(j in 2:len)
{
  ssal[j]=number[j]/slen+ssal[j-1]
}
iid <- c()
for(i in 1:len)
{
  iid[i] = i/len
}

huizong <- data.frame(iid,ssal)

p <- ggplot(data = huizong, aes(x = iid, y = ssal)) +
  geom_line(linetype = "solid",colour="orange",size=1.2) +
  annotate("segment", x = 0.7938,xend = 0.7938, y = 0, yend = 0.915922,colour = "#2b8cbe",size=1.1,linetype="dashed")+
  annotate("segment", x = 0.9787,xend = 0.9787, y = 0, yend = 0.9946997,colour = "#2b8cbe",size=1.1,linetype="dashed")+
  annotate("text", x =0.7938, y = 0.618, label = "mobile app user No.\n 800000")+
  annotate("text", x =0.9787, y = 0.618, label = "mobile app user No.\n 2000000")+
  labs(title = "", x = "Cumulative sample frequency", y = "Cumulative frequency")+
  theme(plot.title = element_text(hjust = 0.5)) 

p