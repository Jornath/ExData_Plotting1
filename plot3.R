## plot3.R
## Data is in the variable "db"
db <- read.table("household_power_consumption.txt",  na.strings = c("NA", "?", "Not Available"), sep = ";", header = T)
db$Date <- as.Date(db$Date, "%d/%m/%Y")
db$Date <- paste(db$Date, db$Time)
db$Date <- strptime(db$Date, "%F %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480)
plot(db$Date, db$Sub_metering_1, type = "l", ylab = "Energy sub metering (kilowatts)", xlab = "", col = "Black")
par(new = T)
lines(db$Date, db$Sub_metering_2, col = "Red", ylab = "", xlab = "")
par(new = T)
lines(db$Date, db$Sub_metering_3, col = "Blue", ylab = "", xlab = "")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c('black', 'red', 'blue'), cex=.75)
dev.off()
