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
png('plot3.png')
plot(data$datetime,data$Sub_metering_1,type='l',ylab="Energy Sub Metering",xlab="")
lines(data$datetime,data$Sub_metering_2,col='red')
lines(data$datetime,data$Sub_metering_3,col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=c(1,1,1),bty='n')
dev.off()