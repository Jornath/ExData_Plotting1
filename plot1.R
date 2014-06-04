## plot1.R
## Data is in the variable "db"
db <- read.table("household_power_consumption.txt",  na.strings = c("NA", "?", "Not Available"), sep = ";", header = T)
db$Date <- as.Date(db$Date, "%d/%m/%Y")
date1 <- as.Date("02/01/2007", "%m/%d/%Y")
date2 <- as.Date("02/02/2007", "%m/%d/%Y")
db <- db[db$Date == date1 | db$Date == date2,]
db$Date <- paste(db$Date, db$Time)
db$Date <- strptime(db$Date, "%F %H:%M:%S")
png(filename = "plot1.png", width = 480, height = 480)
hist(db$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()