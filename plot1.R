## plot1.R
## Data is in the variable "db"
db <- read.table("household_power_consumption.txt",  na.strings = c("NA", "?", "Not Available"), sep = ";", header = T)
png(filename = "plot1.png", width = 480, height = 480)
hist(db$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()