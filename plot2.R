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
png("plot2.png",width = 480, height = 480, unit = "px")

# plot second graph
plot(ymd_hms(paste(data$Date,data2$Time)), data$Global_active_power, 
     type = "l",
     ylab= "Global Active Power (kilowatts)", xlab=""
)

# Close the file
dev.off()
