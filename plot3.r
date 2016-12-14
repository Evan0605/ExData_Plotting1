library(lubridate)

ds <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")
ds$Time <- strptime(paste(ds$Date, ds$Time), "%d/%m/%Y %H:%M:%S")
ds$Date <- as.Date(ds$Date, "%d/%m/%Y")
ds <- subset(ds, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

png("plot3.png", width=480, height=480)
plot(ds$Time, ds$Sub_metering_1, col = "black", type="l", xlab="",
     ylab="Energy sub metering")
lines(ds$Time, ds$Sub_metering_2, col = "red")
lines(ds$Time, ds$Sub_metering_3, col = "blue")
legend("topright", col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.off()
