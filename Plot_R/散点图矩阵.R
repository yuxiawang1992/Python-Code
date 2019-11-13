
# 绘制GWR各个变量的相关系数图

#set current work directory
setwd("E:\\TecentCheckIn\\Economics\\GWR_0403\\")
df <- read.csv("geo_factor_new.CSV", header = TRUE, sep = ",")

panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...)
{
  usr <- par("usr")
  on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y, use = "complete.obs"))
  txt <- format(c(r, 0.123456789), digits = digits)[1]
  txt <- paste0(prefix, txt, sep = "")
  if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex.cor * (1 + r) / 2, col = "grey60")
}

panel.hist <- function(x, ...)
{
  usr <- par("usr")
  on.exit(par(usr))
  par(usr = c(usr[1:2], 0, 1.5) )
  h <- hist(x, breaks = 50, plot = FALSE)
  breaks <- h$breaks
  nB <- length(breaks)
  y <- h$counts
  y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, col = "light green", border = "grey50", ...)
}

panel.lm <- function (x, y, col = "orange", bg = NA, pch = par("pch"),
                      cex = 1, col.smooth = "black", ...)
{
  points(x, y, pch = pch, col = col, bg = bg, cex = cex)
  abline(stats:: lm(y ~ x), col = "grey70",lwd = 2 )
}

pairs(df[,c(11,12,13,15,17,22,24,21)], pch = 16, upper.panel = panel.cor,
      diag.panel = panel.hist, lower.panel = panel.lm)

