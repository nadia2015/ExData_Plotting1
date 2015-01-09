data <- read.csv("household_power_consumption.txt", sep=";",na.strings="?")
newData <- subset(data, Date=="1/2/2007" | Date == "2/2/2007")

 
dx <- paste(newData[,1], newData[,2], sep=" ")

# This line specifies the background color to be white
par(bg="white")

# Initializing a new (empty) plot
plot( strptime(dx, "%d/%m/%Y %H:%M:%S"),newData$Sub_metering_1, 
      type="n",  xlab="", ylab="Energy sub metering")

# Adding points to the plot
points( strptime(dx, "%d/%m/%Y %H:%M:%S"),newData$Sub_metering_1, col = "black", type="l")
points( strptime(dx, "%d/%m/%Y %H:%M:%S"),newData$Sub_metering_2, col = "red", type="l")
points( strptime(dx, "%d/%m/%Y %H:%M:%S"),newData$Sub_metering_3, col = "blue", type="l")

# Drawing a legend for the plot 
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "))


dev.copy(png,file="plot3.png", width=480, height=480)
dev.off()