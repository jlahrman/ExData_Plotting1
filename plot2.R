plot2 = function(){
  
  power_data = read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?", header = TRUE, colClasses = c(rep("character",2), rep("numeric",7)))

# Combine Date and Time into one field
  power_data$date_time = paste(power_data$Date,power_data$Time, sep = ' ')

#I'm still going to convert the Date field into a date so that my subset filter works.
  power_data$Date = as.Date(power_data$Date, format = "%d/%m/%Y")

#Convert date_time into a date time format
  power_data$date_time = strptime(power_data$date_time, format = "%d/%m/%Y %H:%M:%S")
#Subset the data using the date field
  chart_data = subset(power_data, Date >= "2007-02-01" & Date <= "2007-02-02" )

chart_data = chart_data[,c(10,3)]

head(chart_data)
summary(chart_data)

png("plot2.png", width = 480, height = 480)
plot(chart_data$date_time,chart_data$Global_active_power,type = "l", col = "black", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()   
  
}