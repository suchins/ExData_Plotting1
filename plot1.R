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
xfilter$Global_active_power<-as.numeric(xfilter$Global_active_power)
#open png device
png(file="C:\\Course4\\Week1\\plot1.png",width = 480, height = 480)
#create the histogram
hist(xfilter$Global_active_power/1000,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
