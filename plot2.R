library(data.table)
file <- 'household_power_consumption.txt'
household_data <- read.table(file, header = TRUE, sep = ';', na.strings = '?')
DT <- data.table(household_data)
mydata <- DT[Date == '1/2/2007' | Date == '2/2/2007']
mydata[, DateTime := as.POSIXct(strptime(paste(mydata$Date,mydata$Time), "%d/%m/%Y %H:%M:%S"))]

png(file = './plot2.png', width = 480, height = 480)
with(mydata, plot(DateTime, Global_active_power, pch = '.', xlab = '', ylab='Global Active Power (kilowatts)'))
with(mydata, lines(DateTime, Global_active_power))
dev.off()
