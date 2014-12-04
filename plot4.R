##Reading data from file
textdata <- read.csv("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
textdata$Date<- as.Date(textdata$Date, "%d/%m/%Y")

##Subsetting data using date filters
mydata <- subset(textdata,subset=(Date>="2007-02-01" & Date<="2007-02-02"))
##Removing fulldataset
rm(textdata)

##Coverting Datetimes
datetime <- paste(as.Date(mydata$Date),mydata$Time)
mydata$Datetime <- as.POSIXct(datetime)

##Creating Plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

##Global Active power plot
plot(mydata$Global_active_power~mydata$Datetime,type="l",ylab ="Global Active Power",xlab="")

##Voltage plot
plot(mydata$Voltage~mydata$Datetime,type="l",ylab ="Voltage",xlab="")

##Submetering plot
plot(mydata$Sub_metering_1~mydata$Datetime,type="l",ylab ="Global Active Power (kilowatts)",xlab="")
lines(mydata$Sub_metering_2~mydata$Datetime,col="Red")
lines(mydata$Sub_metering_3~mydata$Datetime,col="Blue")

legend("topright",col=c("Black","Red","Blue"),cex=0.25,lty=1,lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Global Reactive Power plot
plot(mydata$Global_reactive_power~mydata$Datetime,type="l",ylab ="Global Reactive Power",xlab="")



##Saving to file
dev.copy(png, file="plot4.png", height=504, width=504)
dev.off()