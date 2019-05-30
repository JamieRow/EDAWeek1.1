## Create Plot1.png
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
#setup Grid
par(mfrow = c(2,2))
#top left
plot(DF$Time, DF$Global_active_power,ylab = "Global Active Power (kilowatts)",xlab = "",type = 'l')
#Top Right
plot(DF$Time, DF$Voltage,ylab = "Voltage",xlab = "",type = 'l')
#bottom left
mylim<-c(0,40)
plot(DF$Time, DF$Sub_metering_1,ylab = "Energy Sub Metering",xlab = "",type = 'l',ylim = mylim)
par(new = T)
plot(DF$Time, DF$Sub_metering_2,ylab = "Energy Sub Metering",xlab = "",type = 'l',ylim = mylim,col ='red')
par(new = T)
plot(DF$Time, DF$Sub_metering_3,ylab = "Energy Sub Metering",xlab = "",type = 'l',ylim = mylim,col ='blue')
legend("topright",col = c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty = c(1,1,1))
#bottom right
plot(DF$Time, DF$Global_reactive_power,ylab = "Global_Reactive_Power",xlab = "",type = 'l')
## Copy to PNG
dev.copy(png,'Plot4.png')
dev.off()