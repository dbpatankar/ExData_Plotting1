# File for generating second plot.
# Clearing all objects
rm(list=ls())

# Reading only the necessary data which is from 01-Feb-2007 to 02-Feb-2007
housedata <- read.table("household_power_consumption.txt", sep=";", header=T, skip=66636, nrow=2*1440, na.string="?")

# Adding a new column DateTime at the end containing both date and time 
housedata$DateTime <- strptime(paste(housedata[,1], housedata[,2]), "%d/%m/%Y %H:%M:%S")

# Renaming the columns
cols <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3", "DateTime")
colnames(housedata) <- cols

# Plotting 
png(file="plot3.png")

plot(housedata$DateTime, housedata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(housedata$DateTime, housedata$Sub_metering_2, col="red")
lines(housedata$DateTime, housedata$Sub_metering_3, col="blue")
legend(x = "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

dev.off()
