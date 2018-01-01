library(dplyr)

## read the data from the working directory

temp <- read.table("household_power_consumption.txt", sep =";",
                   header= TRUE, stringsAsFactors = FALSE)
use <- filter(temp, Date=="1/2/2007"|Date=="2/2/2007")

use$Date <- as.Date(use$Date, format= "%d/%m/%Y")
x<- mutate(use, datime = paste(Date,Time, sep=" "))
x$datime <- strptime(x$datime, format="%Y-%m-%d %H:%M:%S")

## plot the graph in the png file 

png(file="plot2.png", width = 480, height = 480)

plot(x$datime, x$Global_active_power, type="n", xlab="", 
     ylab="Global Active Power (kilowatts)")

lines(x$datime, x$Global_active_power)
dev.off()