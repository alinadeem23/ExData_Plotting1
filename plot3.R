#plot3.R

mydata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
subsetdata<-mydata[mydata$Date %in% c('1/2/2007', '2/2/2007'),]

dates<-paste(subsetdata$Date, subsetdata$Time, sep=' ')
dates<-strptime(dates,'%e/%m/%Y %H:%M:%S')

subm1<-as.numeric(subsetdata$Sub_metering_1)
subm2<-as.numeric(subsetdata$Sub_metering_2)
subm3<-as.numeric(subsetdata$Sub_metering_3)

png('plot3.png', width=480, height = 480)
plot(dates,subm1, type = 'l', col='black',xlab='', ylab='Energy sub metering')
lines(dates, subm2, col='red')
lines(dates, subm3, col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=2.5, col=c('black', 'red', 'blue'))
dev.off()
