## plot2

mydata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
subsetdata<-mydata[mydata$Date %in% c('1/2/2007', '2/2/2007'),]

dates<-paste(subsetdata$Date, subsetdata$Time, sep=' ')
dates<-strptime(dates,'%e/%m/%Y %H:%M:%S')

globalactivepower<-as.numeric(subsetdata$Global_active_power)

png('plot2.png', width=480, height=480)
plot(dates, globalactivepower, type = 'l', 
     ylab="Global Active Power (kilowatts)", xlab='' )
dev.off()