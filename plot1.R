#Exploratory and Data Analysis
#2017-09-10 
#Marlon Martinez

#Assesment Week 1 - Plot 1

#Loading libraries
if (!require("sqldf")) {
  install.packages("sqldf")
}

#loading csv file and filtering for specific dates
pcdata<-read.csv.sql("./household_power_consumption.txt",sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",sep = ";")

#converting the column Date into Date format
pcdata$Date<-as.Date(pcdata$Date)

#making the histogram based on Global active power
hist(pcdata$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",main="Global Active Power")

#exporting graph to PNG file
dev.copy(png,file="plot1.png")
dev.off()
