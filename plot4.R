###Loading the data

hh <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

hh$Date <- as.Date(hh$Date, format="%d/%m/%Y")
newhh <- subset(hh, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hh)
datetime <- paste(as.Date(newhh$Date), newhh$Time)
newhh$Datetime <- as.POSIXct(datetime)


#######   MAKING THE PLOTS ###########

# Plot 2
png("plot2.png", height = 480, width = 480)


plot(newhh$Date, newhh$Sub_metering_1, type="l", main = "Sub-metering of Power Over Days", ylab="Energy sub metering")
lines(newhh$Date, newhh$Sub_metering_2, col="red")
lines(newhh$Date, newhh$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
