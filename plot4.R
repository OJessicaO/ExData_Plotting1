library(dplyr)

## read the data from the working directory

temp <- read.table("household_power_consumption.txt", sep =";",
                   header= TRUE, stringsAsFactors = FALSE)
use <- filter(temp, Date=="1/2/2007"|Date=="2/2/2007")

use$Date <- as.Date(use$Date, format= "%d/%m/%Y")
x<- mutate(use, datime = paste(Date,Time, sep=" "))
x$datime <- strptime(x$datime, format="%Y-%m-%d %H:%M:%S")

## plot the graph in the png file 
png(file="plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

# first plot
plot(x$datime, x$Global_active_power, type="n", xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(x$datime, x$Global_active_power)

# second plot
plot(x$datime, x$Voltage, xlab="datetime", ylab="Voltage", type="n")
lines(x$datime, x$Voltage)

# third plot
plot(x$datime, x$Sub_metering_1, type="n", xlab="", 
     ylab="Energy sub metering")
lines(x$datime, x$Sub_metering_1)
lines(x$datime, x$Sub_metering_2, col="red")
lines(x$datime, x$Sub_metering_3, col="blue")
legend("topright", lwd=2, col=c("black","red","blue"), 
       legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# fourth plot
plot(x$datime, x$Global_reactive_power, xlab="datetime", 
     ylab="Global_reactive_power", type="n")
lines(x$datime, x$Global_reactive_power)

dev.off()
