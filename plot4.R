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

# open device for png
png("plot4.png",width = 480, height = 480, unit = "px")

# create grid for plots drawing 
par(mfrow = c(2,2), mar = c(4,4,2,1))

# create the first and second plots
with(data, {
  plot(date_time,Global_active_power, type = "l", xlab="", ylab="Global Active Power")
  plot(date_time, Voltage, type = "l", xlab="datetime" )
})  
  

# create the third plot
plot(data$date_time, data$Sub_metering_1, 
       type = "n",
       ylab= "Energy sub metering", xlab=""
)
  
lines(data$date_time, data$Sub_metering_1, col="black")
lines(data$date_time, data$Sub_metering_2, col="red")
lines(data$date_time, data$Sub_metering_3, col="blue")
  
legend("topright", pch="__", col=c("black","red","blue"), legend= c("Sub metering 1","Sub metering 2","Sub metering 3"))
  

# Create plot Number 4
with(data, plot(date_time, Global_reactive_power, type = "l"))

# Close the file
dev.off()
