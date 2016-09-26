#************************************************************************************#

#Assignment: Exploratory data analysis
#Author: Sachin S; 
#Date: 09-25-2016

# Description: The script expected the filehousehold_power_consumption.txt to in C:\Course4\Week1\ folder
# Dataset location: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#************************************************************************************#


#read the file
x<-read.table(file="C:\\Course4\\Week1\\household_power_consumption.txt",sep=";",header=TRUE)

#convert to valid data type
x$Date <- as.Date(x$Date ,format="%d/%m/%Y")

#limit the rows by date
xfilter<-x[x$Date=="2007-02-01"|x$Date=="2007-02-02",,] 
#convert to valid data type
xfilter$Sub_metering_1 <-as.numeric(xfilter$Sub_metering_1)
 xfilter$Sub_metering_2 <-as.numeric(xfilter$Sub_metering_2)
 xfilter$Sub_metering_3 <-as.numeric(xfilter$Sub_metering_3)
#open png device
png(file="C:\\Course4\\Week1\\plot3.png",width = 480, height = 480)
#write the scatter plot
with(xfilter,plot(as.POSIXct(paste(Date,Time),"%d/%m/%Y"),Sub_metering_1,xlab="",ylab="Energy sub metering",type="l"))
lines(as.POSIXct(paste(xfilter$Date,xfilter$Time),"%d/%m/%Y"),xfilter$Sub_metering_2,col="red")
lines(as.POSIXct(paste(xfilter$Date,xfilter$Time),"%d/%m/%Y"),xfilter$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering1","Sub_metering2","Sub_metering3"),lwd=c(1,1))
dev.off()