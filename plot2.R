#Exploratory and Data Analysis
#2017-09-10 
#Marlon Martinez

#Assesment Week 1 - Plot 2

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
plot(pcdata$Global_active_power~pcdata$Datetime,type="l",ylab ="Global Active Power (kilowatts)",xlab="")

#exporting graph to PNG file
dev.copy(png,file="plot2.png")
dev.off()
