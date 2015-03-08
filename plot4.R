library(data.table)
file <- 'household_power_consumption.txt'
household_data <- read.table(file, header = TRUE, sep = ';', na.strings = '?')
DT <- data.table(household_data)
mydata <- DT[Date == '1/2/2007' | Date == '2/2/2007']
mydata[, DateTime := as.POSIXct(strptime(paste(mydata$Date,mydata$Time), "%d/%m/%Y %H:%M:%S"))]


png("plot4.png", height=480, width=480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with (mydata, {
  plot(DateTime, Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")
  plot(DateTime, Voltage, type="l",xlab="datetime",ylab="Voltage")
  plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(DateTime, Sub_metering_2, type="l", col="red")
  lines(DateTime, Sub_metering_3, type="l", col="blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col =c("black","red","blue"))
  plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="GLobal_reactive_power")
})
dev.off()
