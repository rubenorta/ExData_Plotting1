library(data.table)
file <- 'household_power_consumption.txt'
household_data <- read.table(file, header = TRUE, sep = ';', na.strings = '?')
DT <- data.table(household_data)
mydata <- DT[Date == '1/2/2007' | Date == '2/2/2007']
mydata[, DateTime := as.POSIXct(strptime(paste(mydata$Date,mydata$Time), "%d/%m/%Y %H:%M:%S"))]

png(file = './plot2.png', width = 480, height = 480)
plot(mydata$DateTime, mydata$Sub_metering_1, xlab = '', ylab='Energy sub metering', type='l', fill='transparent')
lines(mydata$DateTime, mydata$Sub_metering_2, type='l', col = 'red')
lines(mydata$DateTime, mydata$Sub_metering_3, type='l', col = 'blue')
legend("topright", lty = 1, col=c('black', 'red', 'blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()
