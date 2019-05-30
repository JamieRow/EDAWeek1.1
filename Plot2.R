## Create Plot2.png
## Read Data into R

file <- "household_power_consumption.txt"
DF <- read.table(file,header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
headernames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
names(DF) <- headernames
# filter the DF down to the appropriate dates
DF <- DF[DF$Date == "1/2/2007"| DF$Date=="2/2/2007",]
# convert the dates and times
DF[['Time']] <- strptime(paste(DF[['Date']],DF[['Time']],sesep = ' '),format = '%d/%m/%Y %H:%M:%S')
DF[['Date']] <- as.Date(DF[['Date']],format = '%d/%m/%Y')


## Create plot
dev.off()
plot(DF$Time, DF$Global_active_power,ylab = "Global Active Power (kilowatts)",xlab = "",type = 'l')

## Copy to PNG
dev.copy(png,'Plot2.png')
dev.off()