#to know the name of the date column
headers <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), nrows=1, header=T, quote="\"", sep=";")
#store only the rows corresponding to 1/2 february 2007
data <- subset(read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), header=T, quote="\"", sep=";", na.strings="?"), Date=="1/2/2007" | Date=="2/2/2007")

#data conversion
data$Date <- as.Date(data$Date, "%m/%d/%Y")
t<- paste(data$Date, data$Time)
t<- as.POSIXct(strptime(t, "%Y-%d-%m %H:%M:%S"))

#set locale in English
Sys.setlocale("LC_TIME", "C")

png(filename="plot4.png", width = 480, height = 480, , units = "px")
par(mfrow=c(2,2))
#first plot
plot(t, data$Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)", xaxt="n")
axis.POSIXct(1, t, format="%a")

#second plot
plot(t, data$Voltage, type="l", ylab="Voltage", xlab="daytime", xaxt="n")
axis.POSIXct(1, t, format="%a")

#third plot
plot(t, data$Sub_metering_1, type="l", xlab=" ", ylab="Energy sub metering", xaxt="n", col="black")
lines(t, data$Sub_metering_2, type="l",col="red")
lines(t, data$Sub_metering_3, type="l",col="blue")

axis.POSIXct(1, t, format="%a")

legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_1"), 
       lty=c(1,1), lwd=c(2.5,2.5), col=c("black", "blue","red")) 

#forth plot
plot(t, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="daytime", xaxt="n")
axis.POSIXct(1, t, format="%a")

dev.off()