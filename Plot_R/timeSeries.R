data <- read.csv('C:\\Users\\dell\\Desktop\\�����������Ƽ�\\6a493121e53d83f9e119b02942d7c8fe.csv',nrow = 120,header=T,sep=',')
play <- data$play
download <- data$download
collect <- data$collect
dataTimeSeries <- ts(data,frequency = 7,start = c(1,1)) 
playTimeSeries <- ts(play,frequency = 7,start = c(1,1))
downloadTimeSeries <- ts(download,frequency = 7,start = c(1,1))
collectTimeSeries <- ts(collect,frequency = 7, start = c(1,1))
plot.ts(playTimeSeries)

#�ƶ�ƽ���ֽⷨ,���Ƴ��ļ����ԡ����ƵĺͲ����򲿷����ڱ��洢�ڱ���
dataTimeSeriesComponents <- decompose(dataTimeSeries)
seasonal <- dataTimeSeriesComponents$seasonal
trend <- dataTimeSeriesComponents$trend
random <- dataTimeSeriesComponents$random
#plot(trend)

#�ֲ���Ȩ�ع鷨,STL�ֽ⽫ʱ�����зֽ�ɼ���������������
playTimeSeriesComponents <- stl(playTimeSeries,s.window="periodic") 
#plot(playTimeSeriesComponents)
playTimeSeriesComponents <- forecast(playTimeSeriesComponents)
plot(playTimeSeriesComponents)

data1 <- read('C:\\Users\\dell\\Desktop\\�����������Ƽ�\\6a493121e53d83f9e119b02942d7c8fe.csv',header=T,sep=',')
playTimeSeries1 <- ts(data1$play,frequency = 7,start = c(1,1))
lines(playTimeSeries1,col="green")

#ָ��ƽ����(HoltWinters)
playTimeSeries <- ts(play,start = c(1,1))
#plot.ts(playTimeSeries)
playTimeSeriesForecasts <- HoltWinters(playTimeSeries,gamma = FALSE)
#plot(playTimeSeriesForecasts)

#�Իع������ƶ�ƽ����ARIMA��
#���ݸ������Ĳ�������һ��ѡ��ģ����order��q,d,p��
auto.arima(playTimeSeries)
playTimeSeriesArima <- arima(playTimeSeries,order = c(2,0,0))
playTimeSeriesForecasts <- forecast.Arima(playTimeSeriesArima,h=31)
#plot.forecast(playTimeSeriesForecasts)

