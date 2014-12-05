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

##Creating Plot2
plot(mydata$Global_active_power~mydata$Datetime,type="l",ylab ="Global Active Power (kilowatts)",xlab="")

##Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()