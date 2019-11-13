
#加载网络分析包
library(networkD3)

#设置当前工作路径
setwd("E:\\TecentCheckIn\\Migration\\top10\\out\\")

#读取数据
migration_nodes <- read.csv("nodes.csv",header = TRUE,sep=',')
migration_links <- read.csv("links_citys.csv",header = TRUE,sep=',')

# Plot
sankeyNetwork(Links = migration_links,Nodes=migration_nodes,Source = "source",
              Target = "target",Value = "value",NodeID = "name",fontSize = 12,nodeWidth = 30)

