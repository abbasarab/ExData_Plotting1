library(lubridate)
library(dplyr)

data <- read.csv("C://Users/Abbas/Desktop/course4/week1/data.txt",
                 header = TRUE,
                 sep = ";",
                 na.strings = "?")
data$Date <- dmy(data$Date)
data <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
data$Time <- hms(data$Time)

png("plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red"
     )
dev.off()
