library(tidyverse)
library(data.table)
library(dplyr)
setwd("C:/Users/Shahil Sunder/Desktop/Reshay_Project/coursera/ProgrammingAssignment2/ExData_Plotting1")
##load data
dataComplete <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",header=T, 
                           sep=';', na.strings="?")

## subset required dates
powSum <- subset(dataComplete, Date %in% c("1/2/2007","2/2/2007"))

##combine the time at date variables
dateTime <-as.POSIXct(strptime(paste(powSum$Date, powSum$Time, sep=" "),"%d/%m/%Y %H:%M:%S"))
powSum <- cbind(dateTime, powSum)
##remove any na values
powSum <- powSum[complete.cases(powSum), ]
##Create Plot 1
png(filename = "plot1.png", width = 480, height = 480)
hist(powSum$Global_active_power, col="Red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

