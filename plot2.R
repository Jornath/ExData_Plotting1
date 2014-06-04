## plot2.R
## Data is in the variable "db"
db <- read.table("household_power_consumption.txt",  na.strings = c("NA", "?", "Not Available"), sep = ";", header = T)
db$Date <- as.Date(db$Date, "%d/%m/%Y")
db$Date <- paste(db$Date, db$Time)
db$Date <- strptime(db$Date, "%F %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480)
plot(db$Date, db$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()