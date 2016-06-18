#plot4

mydata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
subsetdata<-mydata[mydata$Date %in% c('1/2/2007', '2/2/2007'),]

dates<-paste(subsetdata$Date, subsetdata$Time, sep=' ')
dates<-strptime(dates,'%e/%m/%Y %H:%M:%S')

volt<-as.numeric(subsetdata$Voltage)
globalactivepower<-as.numeric(subsetdata$Global_active_power)
subm1<-as.numeric(subsetdata$Sub_metering_1)
subm2<-as.numeric(subsetdata$Sub_metering_2)
subm3<-as.numeric(subsetdata$Sub_metering_3)
globalreactivepower<-as.numeric(subsetdata$Global_reactive_power)


png('plot4.png', width=480, height=480)
par(mfrow=c(2,2))

plot(dates, globalactivepower, type='l', xlab = '', ylab = 'Global Active Power')
plot(dates, volt, type='l', xlab='datetime', ylab = 'Voltage')
plot(dates,subm1, type = 'l', col='black',xlab='', ylab='Energy sub metering')
lines(dates, subm2, col='red')
lines(dates, subm3, col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=2.5, col=c('black', 'red', 'blue'))
plot(dates, globalreactivepower, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')

dev.off()
