## read the data from the working directory
library(dplyr)
 
temp <- read.table("household_power_consumption.txt", sep =";",
                   header= TRUE, stringsAsFactors = FALSE)
use <- filter(temp, Date=="1/2/2007"|Date=="2/2/2007")

use$Global_active_power <- as.numeric(use$Global_active_power)

## plot the graph in the png file 

png(file="plot1.png", width = 480, height = 480)

hist(use$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()