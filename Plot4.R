data<-read.table(file = "household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")

data <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
data<-data[complete.cases(data),]
datatime<-paste(data$Date,data$Time)
data<-cbind(data,datatime)
data$datatime<-as.POSIXct(datatime)

par(mfrow=c(2,2))
plot(data$Global_active_power~data$datatime,ylab="Global Active Power(Kilowatts)",xlab="",type="l")
plot(data$Voltage~data$datatime,type="l",ylab = "Voltage (volts)",xlab="")  
plot(data$datatime,data$Sub_metering_1,col="black",type="l",ylab="Energy Sub Metering",xlab = "")
lines(data$datatime,data$Sub_metering_2,col="red")
lines(data$datatime,data$Sub_metering_3,col="blue")
legend("topright",lwd=c(1,1,1),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = "solid",col = c("black","red","blue"))
plot(data$Global_reactive_power~data$datatime,ylab = "Global Reactive Power(Kilowatts)",xlab="",type="l")

dev.copy(png,"Plot4.png",width=480,height=480)
dev.off()