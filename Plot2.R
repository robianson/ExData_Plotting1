if (!('data' %in% ls())) { 
  alldata <- read.table('household_power_consumption.txt',header=TRUE,sep=';',stringsAsFactors = FALSE)
  data <-  alldata[which(alldata$Date %in% c("1/2/2007","2/2/2007")),]
  rm(alldata)
  data$Global_active_power <- as.numeric(data$Global_active_power)
  data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
  data$Voltage <- as.numeric(data$Voltage)
  data$Global_intensity <- as.numeric(data$Global_intensity)
  data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
  data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
  data$datetime <- strptime(paste(data$Date,data$Time),format='%d/%m/%Y %H:%M:%S')
}
png('plot2.png')
plot(data$datetime,data$Global_active_power,type='l',ylab="Global Active Power (kilowatts)",xlab="")
dev.off()