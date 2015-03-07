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

#second plot
png(filename="plot2.png", width = 480, height = 480, , units = "px")
#par(mar=c(5,5,2,2))
plot(t, data$Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)", xaxt="n")
axis.POSIXct(1, t, format="%a")
dev.off()