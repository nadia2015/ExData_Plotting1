data <- read.csv("household_power_consumption.txt", sep=";",na.strings="?")
newData <- subset(data, Date=="1/2/2007" | Date == "2/2/2007")
dx <- paste(newData[,1], newData[,2], sep=" ")


# This line helps plotting multiple plots, 2 per row (plot filled column-wise)
par(mfcol = c(2, 2))

par(bg="white")

plot(strptime(dx,"%d/%m/%Y %H:%M:%S"), newData[,3], type="l",
         ylab="Global Active Power (kilowatts)", xlab="")

plot( strptime(dx, "%d/%m/%Y %H:%M:%S"),newData$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")

points( strptime(dx, "%d/%m/%Y %H:%M:%S"),newData$Sub_metering_1, col = "black", type="l")
points( strptime(dx, "%d/%m/%Y %H:%M:%S"),newData$Sub_metering_2, col = "red", type="l")
points( strptime(dx, "%d/%m/%Y %H:%M:%S"),newData$Sub_metering_3, col = "blue", type="l")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), bty="n")

# Plotting the Voltage in relation to date and time
plot(strptime(dx,"%d/%m/%Y %H:%M:%S"), newData[,5], type="l", ylab="Voltage", xlab="datetime")

# Plotting Global_reactive_Power in relation to date and time
plot(strptime(dx,"%d/%m/%Y %H:%M:%S"), newData[,4], type="l", ylab="Global_reactive_power",
     xlab="datetime")

dev.copy(png,file="plot4.png", width=480, height=480)
dev.off()
