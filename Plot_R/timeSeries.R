data <- read.csv('C:\\Users\\dell\\Desktop\\阿里云音乐推荐\\6a493121e53d83f9e119b02942d7c8fe.csv',nrow = 120,header=T,sep=',')
play <- data$play
download <- data$download
collect <- data$collect
dataTimeSeries <- ts(data,frequency = 7,start = c(1,1)) 
playTimeSeries <- ts(play,frequency = 7,start = c(1,1))
downloadTimeSeries <- ts(download,frequency = 7,start = c(1,1))
collectTimeSeries <- ts(collect,frequency = 7, start = c(1,1))
plot.ts(playTimeSeries)

#移动平均分解法,估计出的季节性、趋势的和不规则部分现在被存储在变量
dataTimeSeriesComponents <- decompose(dataTimeSeries)
seasonal <- dataTimeSeriesComponents$seasonal
trend <- dataTimeSeriesComponents$trend
random <- dataTimeSeriesComponents$random
#plot(trend)

#局部加权回归法,STL分解将时间序列分解成季节项、趋势项及残余项
playTimeSeriesComponents <- stl(playTimeSeries,s.window="periodic") 
#plot(playTimeSeriesComponents)
playTimeSeriesComponents <- forecast(playTimeSeriesComponents)
plot(playTimeSeriesComponents)

data1 <- read('C:\\Users\\dell\\Desktop\\阿里云音乐推荐\\6a493121e53d83f9e119b02942d7c8fe.csv',header=T,sep=',')
playTimeSeries1 <- ts(data1$play,frequency = 7,start = c(1,1))
lines(playTimeSeries1,col="green")

#指数平滑法(HoltWinters)
playTimeSeries <- ts(play,start = c(1,1))
#plot.ts(playTimeSeries)
playTimeSeriesForecasts <- HoltWinters(playTimeSeries,gamma = FALSE)
#plot(playTimeSeriesForecasts)

#自回归整合移动平均（ARIMA）
#根据给出来的参数在下一步选择建模参数order（q,d,p）
auto.arima(playTimeSeries)
playTimeSeriesArima <- arima(playTimeSeries,order = c(2,0,0))
playTimeSeriesForecasts <- forecast.Arima(playTimeSeriesArima,h=31)
#plot.forecast(playTimeSeriesForecasts)


