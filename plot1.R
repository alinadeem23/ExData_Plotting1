## making graphs
#Reading in the data file
mydata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
subsetdata<-mydata[mydata$Date %in% c('1/2/2007', '2/2/2007'),]

dates<-paste(subsetdata$Date, subsetdata$Time, sep=' ')
dates<-strptime(dates,'%e/%m/%Y %H:%M:%S')

globalactivepower<-as.numeric(subsetdata$Global_active_power)

png('plot1.png', width=480, height=480)
hist(globalactivepower, 
    main="Global Active Power", 
    xlab="Global Active Power (kilowatts)", ylab='Frequency', 
    border="black", 
    col="red")
dev.off()
