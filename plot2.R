library(lubridate)
library(dplyr)

data <- read.csv("C://Users/Abbas/Desktop/course4/week1/data.txt",
                 header = TRUE,
                 sep = ";",
                 na.strings = "?")
data$Date <- dmy(data$Date)
data <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
data$Time <- hms(data$Time)

png("plot2.png", width = 480, height = 480, units = "px")
plot(1:dim(data)[1], data$Global_active_power,
     ylab = "Global Active Power(kilowatts)",
     xlab = "",
     xaxt = "n",
     type = "l")
xticks <- c(unique(as.character(wday(data$Date, label = TRUE))),
            as.character(wday(data$Date[length(data$Date)] + days(1), label = TRUE)))
xticks_pos <- seq(1, dim(data)[1], length.out = 3)
axis(side = 1, at = xticks_pos, labels = xticks)
dev.off()
