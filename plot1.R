library(data.table)
file <- 'household_power_consumption.txt'
household_data <- read.table(file, header = TRUE, sep = ';', na.strings = '?')
DT <- data.table(household_data)
mydata <- DT[Date == '1/2/2007' | Date == '2/2/2007']

png(file = './plot1.png', width = 480, height = 480)
hist(mydata$Global_active_power, col='red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off()

