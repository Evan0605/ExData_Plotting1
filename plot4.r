library(lubridate)

ds <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")
ds$Time <- strptime(paste(ds$Date, ds$Time), "%d/%m/%Y %H:%M:%S")
ds$Date <- as.Date(ds$Date, "%d/%m/%Y")
ds <- subset(ds, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(ds$Time, ds$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")

plot(ds$Time, ds$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(ds$Time, ds$Sub_metering_1, col = "black", type="l", xlab="",
     ylab="Energy sub metering")
lines(ds$Time, ds$Sub_metering_2, col = "red")
lines(ds$Time, ds$Sub_metering_3, col = "blue")
legend("topright", col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n")

plot(ds$Time, ds$Global_reactive_power, type = "n",
     xlab = "datetime", ylab = "Global_reactive_power")
lines(ds$Time, ds$Global_reactive_power)

dev.off()
