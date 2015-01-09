# This line reads the text file into data
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# This line takes a subset from the original data frame for dates 1/2/2007 and 2/2/2007 
newData <- subset(data, Date=="1/2/2007" | Date == "2/2/2007")

# This line draws a histogram of frequency of Global_active_power variable
hist(newData[,3], main = "Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency", col="red")

# This line copies the histogram to a PNG file and specifies the height and width
dev.copy(png,file="plot1.png", width=480, height=480)
# Closing the PNG device
dev.off()
