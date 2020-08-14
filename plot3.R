##
## Author: FJGC
## Date: 14-Aug-2020
## plot3.R: builds the 1st plot. 1st reads the information and then builds the plot
## with required parameters
##

## Sets the working directory
setwd("~/Learning_R/ExplorAnalysis")

## Reads the data set
dataset <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", 
 nrows = 2075259, check.names = FALSE, stringsAsFactors = FALSE, comment.char = "", quote = '\"')

## Sub-Sets the data set records by Date within 01-Feb-2007 and 02-Feb-2007
data1 <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))

## Formats Date and handles time
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

## Builds plot 3
with(data1, {
 plot(Sub_metering_1~Datetime, type = "l",
 ylab = "Global Active Power (kilowatts)", xlab = "")
 lines(Sub_metering_2~Datetime,col = 'Red')
 lines(Sub_metering_3~Datetime,col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Annotating the graph:
title(main="Energy sub-metering")

## Writes the PNG file and closes the device
dev.copy(device = png, file = "plot3.png", height = 480, width = 480)
dev.off()
