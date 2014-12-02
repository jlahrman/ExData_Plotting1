plot1 = function(){
  
  power_data = read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?", header = TRUE, colClasses = c(rep("character",2), rep("numeric",7)))

#Option that converts Date field to a date
  power_data$Date = as.Date(power_data$Date, format = "%d/%m/%Y")
  hist_data = subset(power_data, Date >= "2007-02-01" & Date <= "2007-02-02" )

#Option that leaves Date field as a character
#hist_data = data.frame()
#temp_data = subset(power_data, Date == "1/2/2007")
#hist_data = rbind(hist_data,temp_data)
#temp_data = subset(power_data, Date == "2/2/2007")
#hist_data = rbind(hist_data,temp_data)

hist_data = hist_data[,c(1,2,3)]

png("plot1.png", width = 480, height = 480)
hist(hist_data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", yaxt = "n")
axis(side = 2, at=seq(0,1200,200))
dev.off()  
  
}