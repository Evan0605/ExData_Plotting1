library(lubridate)

ds <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")
ds$Time <- strptime(paste(ds$Date, ds$Time), "%d/%m/%Y %H:%M:%S")
ds$Date <- as.Date(ds$Date, "%d/%m/%Y")
ds <- subset(ds, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

png("plot2.png", width=480, height=480)
plot(ds$Time, ds$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
