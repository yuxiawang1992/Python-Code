
#绘制曲线图
library(ggplot2);library(scales);library(grid);library(RColorBrewer)
library(forecast)
data <- read.csv('E:\\实验室\\项目资料\\上海项目\\安全商圈\\商圈各种指标数据\\telecom_user_number_day_sum.csv',header=T,sep=',')


#hankou_data <- data[(data["month"]==1 & data["admin_code"] == 956),]
ggplot(data=data,aes(x= data$fid,y = data$count))+
  geom_line(size=1,colour='orange')+
  scale_x_continuous(breaks=seq( 0, 105, by = 20)) +
  scale_y_continuous(labels=comma) +
  labs(title="Distribution of location request user No.", x="Days", y="Location request user No.") 

#ggsave("mtcars.pdf", width = 20, height = 20, units = "cm")

#分解时间序列
day_series = ts(data$count,frequency = 7, start = c(1,1))
#plot.ts(day_series)

#指数平滑法(HoltWinters)
day_series_fitted <- HoltWinters(day_series,alpha=0.15,beta=0.1,gamma=0.1,seasonal = "mult")
#lines(fitted(day_series_forecasts)[,1], col = 3)
plot(day_series_fitted)
day_series_forecast <- predict(day_series_fitted, n.ahead = 7, prediction.interval = T, level = 0.95)
plot(day_series_fitted, day_series_forecast)

#自回归整合移动平均（ARIMA）
#根据给出来的参数在下一步选择建模参数order（q,d,p）
auto.arima(day_series)
daySeriesArima <- arima(day_series,order = c(2,0,0))
daySeriesForecasts <- forecast.Arima(daySeriesArima,h=31)
plot.forecast(daySeriesForecasts)



