plot4 = function(){
  
  power_data = read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?", header = TRUE, colClasses = c(rep("character",2), rep("numeric",7)))

# Combine Date and Time into one field
  power_data$date_time = paste(power_data$Date,power_data$Time, sep = ' ')

#I'm still going to convert the Date field into a date so that my subset filter works.
  power_data$Date = as.Date(power_data$Date, format = "%d/%m/%Y")

#Convert date_time into a date time format
  power_data$date_time = strptime(power_data$date_time, format = "%d/%m/%Y %H:%M:%S")
#Subset the data using the date field
  chart_data = subset(power_data, Date >= "2007-02-01" & Date <= "2007-02-02" )

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(chart_data$date_time,chart_data$Global_active_power,type = "l", col = "black", xlab = "", ylab = "Global Active Power")

plot(chart_data$date_time,chart_data$Voltage,type = "l", col = "black", xlab = "datetime", ylab = "Voltage")

plot(chart_data$date_time,chart_data$Sub_metering_1,type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(chart_data$date_time, chart_data$Sub_metering_2, col="red")
  lines(chart_data$date_time, chart_data$Sub_metering_3, col="blue")
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=rep(1,3), col=c("black","red","blue"))

plot(chart_data$date_time,chart_data$Global_reactive_power,type = "l", col = "black", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()   
  
}