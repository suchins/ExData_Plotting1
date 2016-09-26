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

#convert to valid data types
xfilter$Global_active_power<-as.numeric(xfilter$Global_active_power)
xfilter$Sub_metering_1 <-as.numeric(xfilter$Sub_metering_1)
xfilter$Sub_metering_2 <-as.numeric(xfilter$Sub_metering_2)
xfilter$Sub_metering_3 <-as.numeric(xfilter$Sub_metering_3)
xfilter$Voltage <-as.numeric(xfilter$Voltage)
xfilter$xfilter$Global_reactive_power<-as.numeric(xfilter$Global_reactive_power)

#open png device
png(file="C:\\Course4\\Week1\\plot4.png",width = 480, height = 480)
#create 2x2 window for writing plot
par(mfrow=c(2,2))
#write the scatter plot
with(xfilter,plot(as.POSIXct(paste(Date,Time),"%d/%m/%Y"),Global_active_power/1000,xlab="",ylab="Global Active Power",type="l"))
with(xfilter,plot(as.POSIXct(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),Voltage/4,xlab="datetime",ylab="Voltage",type="l"))
with(xfilter,plot(as.POSIXct(paste(Date,Time),"%d/%m/%Y"),Sub_metering_1,xlab="",ylab="Energy sub metering",type="l"))
lines(as.POSIXct(paste(xfilter$Date,xfilter$Time),"%d/%m/%Y"),xfilter$Sub_metering_2,col="red")
lines(as.POSIXct(paste(xfilter$Date,xfilter$Time),"%d/%m/%Y"),xfilter$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering1","Sub_metering2","Sub_metering3"),lwd=c(1,1))
with(xfilter,plot(as.POSIXct(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),Global_reactive_power,xlab="datetime",type="l"))
dev.off()