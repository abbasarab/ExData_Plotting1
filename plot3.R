library(lubridate)
library(dplyr)

data <- read.csv("C://Users/Abbas/Desktop/course4/week1/data.txt",
                 header = TRUE,
                 sep = ";",
                 na.strings = "?")
data$Date <- dmy(data$Date)
data <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
data$Time <- hms(data$Time)

png("plot3.png", width = 480, height = 480, units = "px")
plot(1:dim(data)[1], data$Sub_metering_1,
     type = "l",
     xlab = "",
     xaxt = "n",
     ylab = "Energy sub metering")
points(1:dim(data)[1], data$Sub_metering_2,
     type = "l",
     col = "red")
points(1:dim(data)[1], data$Sub_metering_3,
       type = "l",
       col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1,1,1))
xticks <- c(unique(as.character(wday(data$Date, label = TRUE))),
            as.character(wday(data$Date[length(data$Date)] + days(1), label = TRUE)))
xticks_pos <- seq(1, dim(data)[1], length.out = 3)
axis(side = 1, at = xticks_pos, labels = xticks)
dev.off()
