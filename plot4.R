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

##Create Plot 4
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

##Plot 2 - Top Left
with(powSum, plot(dateTime,Global_active_power, type = "l", col = "black", xlab = "", ylab = "Global Active Power (kilowatts)"))


##Top right dateTime and Volatage
with(powSum, plot(dateTime,Voltage, type = "l", col = "black", xlab = "datetime", ylab = "Voltage"))

##bottom left Plot 3
with(powSum, 
     {plot(dateTime, Sub_metering_1, type="l", col = "black", xlab="", ylab="Energy sub metering")
       lines(dateTime,Sub_metering_2, type = "l", col = "red")
       lines(dateTime,Sub_metering_3, type = "l", col = "blue")
       legend("topright", lty = "solid", col = c("black","red","blue"),
              legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     })

##bottom right datetime and Global Reactive Power
with(powSum, plot(dateTime,Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = "Global_reactive_power"))

dev.off()

