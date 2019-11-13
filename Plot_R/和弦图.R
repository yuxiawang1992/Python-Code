
#加载网络分析包
library(devtools);library(recharts);library(knitr);library(reshape2)

#设置当前工作路径
setwd("C:\\Users\\dell\\Desktop\\plot\\")
 
#读取数据
migration_links <- read.csv("migration_links.csv",header = TRUE,sep=',')

#绘图
migration <- data.frame(source= migration_links$source,
                        target = migration_links$target,
                        flow = migration_links$flow)
echartR(migration, c(source,target),flow,target,type='chord', subtype='ribbon') %>% 
  setTitle('Chinese population migration between provinces','From the sixth national population census') %>%
  setLegend(pos = 12) %>%
  setToolbox(show = TRUE,lang='en', pos=2) 


