###Loading the data

hh <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

hh$Date <- as.Date(hh$Date, format="%d/%m/%Y")
newhh <- subset(hh, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hh)
datetime <- paste(as.Date(newhh$Date), newhh$Time)
newhh$Datetime <- as.POSIXct(datetime)


#######   MAKING THE PLOTS ###########

# Plot 1

png("plot1.png", height = 480, width = 480)


hist(newhh$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
