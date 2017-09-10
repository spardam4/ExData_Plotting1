#Exploratory and Data Analysis
#2017-09-10 
#Marlon Martinez

#Assesment Week 1 - Plot 3

#Loading libraries
if (!require("sqldf")) {
  install.packages("sqldf")
}

#loading csv file and filtering for specific dates
pcdata<-read.csv.sql("./household_power_consumption.txt",sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",sep = ";",na.strings="?")

#converting the column Date into Datetime format
pcdata$Datetime<-paste(pcdata$Date,pcdata$Time)
pcdata$Datetime<-as.POSIXct(strptime(pcdata$Datetime, "%d/%m/%Y %H:%M:%S"))

names(pcdata)
#plotting
plot(pcdata$Sub_metering_1~pcdata$Datetime,type="l",ylab ="Energy sub metering",xlab="")
lines(pcdata$Sub_metering_2~pcdata$Datetime,type="l",ylab ="Energy sub metering",xlab="",col="red")
lines(pcdata$Sub_metering_3~pcdata$Datetime,type="l",ylab ="Energy sub metering",xlab="",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd=2,col = c("black","red","blue"))

#exporting graph to PNG file
dev.copy(png,file="plot3.png")
dev.off()
