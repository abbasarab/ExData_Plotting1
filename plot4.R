library(lubridate)
library(dplyr)

data <- read.csv("C://Users/Abbas/Desktop/course4/week1/data.txt",
                 header = TRUE,
                 sep = ";",
                 na.strings = "?")
data$Date <- dmy(data$Date)
data <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
data$Time <- hms(data$Time)
x <- 1:dim(data)[1]
#####################################################
##Setting ticks labels and positions on x-axis#######
xticks <- c(unique(as.character(wday(data$Date, label = TRUE))),
            as.character(wday(data$Date[length(data$Date)] + days(1), label = TRUE)))

xticks_pos <- seq(1, dim(data)[1], length.out = 3)

png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
###################plot 1###################
plot(x, data$Global_active_power,
     type = "l",
     ylab = "Global Active Power", 
     xlab = "",
     xaxt = "n")
axis(side = 1, at = xticks_pos, labels = xticks)
############################################
##################plot 2####################
plot(x, data$Voltage,
     type = "l",
     ylab = "Voltage",
     xlab = "datetime",
     xaxt = "n")
axis(side = 1, at = xticks_pos, labels = xticks)
#############################################
##################plot 3#####################
plot(x, data$Sub_metering_1,
     type = "l",
     xlab = "",
     xaxt = "n",
     ylab = "Energy sub metering")
points(x, data$Sub_metering_2,
       type = "l",
       col = "red")
points(x, data$Sub_metering_3,
       type = "l",
       col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1,1,1))
axis(side = 1, at = xticks_pos, labels = xticks)
################################################
###################plot 4#######################
plot(x, data$Global_reactive_power, 
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power",
     xaxt = "n")
axis(side = 1, at = xticks_pos, labels = xticks)


dev.off()
