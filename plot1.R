##
## Author: FJGC
## Date: 14-Aug-2020
## plot1.R: builds the 1st plot. 1st reads the information and then builds the histogram
##          with required parameters
##

## Sets the working directory
setwd("~/Learning_R/ExplorAnalysis")

## Reads the data set
dataset <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", 
           nrows = 2075259, check.names = FALSE, stringsAsFactors = FALSE, comment.char = "", quote = '\"')

## Sub-Sets the data set records by Date within 01-Feb-2007 and 02-Feb-2007
data1 <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))

## Formats Date
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")

## Builds the histogram
hist(data1$Global_active_power, main = "Global Active Power", 
   xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

## Writes the PNG file and closes the device
dev.copy(device = png, file = "plot1.png", height = 480, width = 480)
dev.off()