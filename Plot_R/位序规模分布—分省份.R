
#腾讯签到数据 各个城市的位序规模分布图
#王玉霞 20161120 分析各个城市的位序规模分布情况

library(ggplot2);library(grid);library(lattice);

setwd("E:\\TecentCheckIn\\study area new\\txt\\")

df <- read.csv("RankSize_Province_del.csv",header = TRUE)

province_name  <- c("北京市","天津市","河北省","山西省","内蒙古自治区","辽宁省",
                    "吉林省","黑龙江省","上海市","江苏省","浙江省","安徽省","福建省",
                    "江西省","山东省","河南省","湖北省","湖南省","广东省","宁夏回族自治区",
                    "广西壮族自治区","海南省","四川省","贵州省","云南省","西藏自治区",
                    "陕西省","甘肃省","青海省","新疆维吾尔自治区","香港特别行政区","澳门特别行政区")

#新建绘图页面
grid.newpage()  ##新建页面
pushViewport(viewport(layout = grid.layout(5,6))) ##将页面分成6*6矩阵
vplayout <- function(x,y){
  viewport(layout.pos.row = x, layout.pos.col = y)
}

#向量赋值，学习一下
# x <- vector(mode="numeric",length=n) , x <- vector(length=n)
# x <- numeirc(n)  #长度可变的存储数字的向量
# x <- character(n) #长度可变的存储字符的向量

for (i in 1:(length(province_name)-2)){
  #截取某一个省份的数据
  df_new <- (df[df$Province.Name == province_name[i],])
  # 按照某一列进行排序
  df_new_sort <- df_new[order(df_new$Before.Spring,decreasing = TRUE),]
  # 自变量和因变量
  Check_In <- df_new_sort$Before.Spring
  Rank <- c(1:length(Check_In))

  # 回归分析参数
  lm.sol<-lm(log(Check_In) ~ log(Rank))
  summary(lm.sol)
  c <- round(coef(lm.sol),3)

  # 绘制散点图
  #注意 geom_text中如果用expression()来进行表达，必须开启parse = TRUE
  #同时以字符串""的形式表示，不能使用expression
  province_plot <- ggplot(data = df_new_sort,aes(x=log(Rank), y = log(Check_In)))+
    geom_point(size = 2,colour = 'red')+
    geom_smooth(method = "lm")+
    #geom_text(aes(x= 0.5,y=13.5),label=paste(" y = ", c[2], " * x "," + ", c[1]),
    #size = 4)+
    labs(title = (paste(province_name[i],'\n',"y =", c[2], "*x "," + ", c[1])), x=" ", y=" ")+
    theme(
      plot.title = element_text(color="black", size=10, face="bold")
    )
  #输出绘图
  row_plot = ceiling(i/6)
  col_plot = i%%6
  if (col_plot==0 ) col_plot = 6
  print(province_plot,vp=vplayout(row_plot,col_plot))
}
