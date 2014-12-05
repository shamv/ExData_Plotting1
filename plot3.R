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

##Creating Plot3
plot(mydata$Sub_metering_1~mydata$Datetime,type="l",ylab ="Global Active Power (kilowatts)",xlab="")
lines(mydata$Sub_metering_2~mydata$Datetime,col="Red")
lines(mydata$Sub_metering_3~mydata$Datetime,col="Blue")

legend("topright",col=c("Black","Red","Blue"),cex=0.5,lty=1,lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))



##Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()