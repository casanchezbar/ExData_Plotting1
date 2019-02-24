library(lubridate)
library(dplyr)

# read the data
data <- read.csv2("../Data/household_power_consumption.txt", stringsAsFactors = F)

# parse objects type
data$Date <- dmy(data$Date)
data$Global_active_power <- as.numeric(data$Global_active_power)

# filter dates
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# open device for png
png("plot1.png",width = 480, height = 480, unit = "px")

# create the histogram for plot1
hist(data$Global_active_power, 
     main = "Global Active Power", 
     xlab= "Global Active Power (kilowatts)", 
     col="red", 
     xlim=range(c(0,6)), ylim=range(0:1200)
)

# Close the file
dev.off()
