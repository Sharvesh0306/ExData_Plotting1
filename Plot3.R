data<-read.table(file = "household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")

data <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
data<-data[complete.cases(data),]
datatime<-paste(data$Date,data$Time)
data<-cbind(data,datatime)
data$datatime<-as.POSIXct(datatime)

plot(data$datatime,data$Sub_metering_1,col="black",type="l",ylab="Energy Sub Metering",xlab = "")
lines(data$datatime,data$Sub_metering_2,col="red")
lines(data$datatime,data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = "solid",col = c("black","red","blue"))

dev.copy(png,"Plot3.png",width=480,height=480)
dev.off()