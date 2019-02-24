library(lubridate)
library(dplyr)

# read the data
data <- read.csv2("../Data/household_power_consumption.txt", stringsAsFactors = F)

# parse objects type
data$Date <- dmy(data$Date)
data$Global_active_power <- as.numeric(data$Global_active_power)

# filter dates
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
data$date_time <- ymd_hms(paste(data$Date, data$Time))

png("plot3.png",width = 480, height = 480, unit = "px")

plot(data$date_time, data$Sub_metering_1, 
     type = "n",
     ylab= "Energy sub metering", xlab=""
)

lines(data$date_time, data$Sub_metering_1, col="black")
lines(data$date_time, data$Sub_metering_2, col="red")
lines(data$date_time, data$Sub_metering_3, col="blue")

legend("topright", pch="__", col=c("black","red","blue"), legend= c("Sub metering 1","Sub metering 2","Sub metering 3"))

# Close the file
dev.off()
