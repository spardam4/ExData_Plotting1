#Exploratory and Data Analysis
#2017-09-10 
#Marlon Martinez

#Assesment Week 1 - Plot 4

#Loading libraries
if (!require("sqldf")) {
  install.packages("sqldf")
}

#loading csv file and filtering for specific dates
pcdata<-read.csv.sql("./household_power_consumption.txt",sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",sep = ";",na.strings="?")

#converting the column Date into Datetime format
pcdata$Datetime<-paste(pcdata$Date,pcdata$Time)
pcdata$Datetime<-as.POSIXct(strptime(pcdata$Datetime, "%d/%m/%Y %H:%M:%S"))


#plotting
#defining 2 rows of 2 columns
par(mfrow=c(2,2))

#graph row 1 column 1
plot(pcdata$Global_active_power~pcdata$Datetime,type="l",ylab ="Global Active Power (kilowatts)",xlab="")

#graph row 1 column 2
plot(pcdata$Voltage~pcdata$Datetime,type="l",ylab ="Voltage",xlab="datetime")

#graph row 2 column 1    
plot(pcdata$Sub_metering_1~pcdata$Datetime,type="l",ylab ="Energy sub metering",xlab="")
lines(pcdata$Sub_metering_2~pcdata$Datetime,type="l",ylab ="Energy sub metering",xlab="",col="red")
lines(pcdata$Sub_metering_3~pcdata$Datetime,type="l",ylab ="Energy sub metering",xlab="",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd=2,col = c("black","red","blue"))

#graph row 1 column 2
plot(pcdata$Global_reactive_power~pcdata$Datetime,type="l",ylab ="Global_reactive_power",xlab="datetime")

#exporting graph to PNG file
dev.copy(png,file="plot4.png")
dev.off()
