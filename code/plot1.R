#to know the name of the date column
headers <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), nrows=1, header=T, quote="\"", sep=";")
#store only the rows corresponding to 1/2 february 2007
data <- subset(read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), header=T, quote="\"", sep=";", na.strings="?"), Date=="1/2/2007" | Date=="2/2/2007")


#first plot
#par(mar=c(5,5,2,2))
png(filename="plot1.png", width = 480, height = 480, , units = "px")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power", ylab="Frequency")
dev.off()