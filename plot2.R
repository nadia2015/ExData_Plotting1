data <- read.csv("household_power_consumption.txt", sep=";",na.strings="?")
newData <- subset(data, Date=="1/2/2007" | Date == "2/2/2007")

# This line combines the Date and Time columns into one
dx <- paste(newData[,1], newData[,2], sep=" ")

# Converting character date and time into objects of "POSIXlt" "POSIXt" class 
plot(strptime(dx,"%d/%m/%Y %H:%M:%S"), newData[,3], type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png,file="plot2.png", width=480, height=480)
dev.off()
