setwd("D:/TAF/JOHNS HOPKINS DATA SCIENCE SPECIALIZATION/4. EXPLORATORY DATA ANALYSIS")

## GETTING DATA
url = "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "./file.zip", method = "auto")
unzip("./file.zip")
table <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = '?', colClasses = c(rep("factor",2), rep("numeric",7)))
data <- data.frame(table)
data$x <- paste(data$Date, data$Time)
data$y <- strptime(data$x, "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
a <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
a$Global_active_power_kw <- a$Global_active_power / 1000
b <- cbind (a, a$Global_active_power_kw)
 
## GRAPHIC CREATION 
library(datasets)
with(b, plot(y, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

## IMAGE CREATION
dev.copy(png, file = "plot2.png")
dev.off()