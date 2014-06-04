## plot4.R
## Data is in the variable "db"
db <- read.table("household_power_consumption.txt",  na.strings = c("NA", "?", "Not Available"), sep = ";", header = T)
db$Date <- as.Date(db$Date, "%d/%m/%Y")
db$Date <- paste(db$Date, db$Time)
db$Date <- strptime(db$Date, "%F %H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(db$Date, db$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
plot(db$Date, db$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(db$Date, db$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "Black")
par(new = T)
lines(db$Date, db$Sub_metering_2, col = "Red", ylab = "", xlab = "")
par(new = T)
lines(db$Date, db$Sub_metering_3, col = "Blue", ylab = "", xlab = "")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c('black', 'red', 'blue'), cex=.75, bty = "n")
plot(db$Date, db$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()
