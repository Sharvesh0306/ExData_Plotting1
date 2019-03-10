data<-read.table(file = "household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")

data <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
data<-data[complete.cases(data),]
datatime<-paste(data$Date,data$Time)
data<-cbind(data,datatime)
data$datatime<-as.POSIXct(datatime)

hist(data$Global_active_power,xlab = "Global Active Power(Kilowatts)", col = "red")

dev.copy(png,"Plot1.png",width=480,height=480)
dev.off()