library(readr)
library(graphics)
library(grDevices)

## Read the data into R
data<-read.table(file = "./household_power_consumption.txt", sep = ";", header = TRUE, na.strings=c("","?","NA"), colClasses = c(rep("character", 2), rep("numeric", 7)))

## Convert dates to appropriate variable type
dates<-data[,1]
Date<-as.Date(dates, "%d/%m/%Y")

## Convert times to appropirate variable type
times<-data[,2]
d_t<-paste(dates,times)
Time<-strptime(d_t, "%d/%m/%Y %H:%M:%S")

## Add Date and Time to the original data
dataset<-cbind(data, Date, Time)

## Get rid of the previous data and times information
dataset<-dataset[,3:11]

## Subset the data
data_subsetted<-subset(dataset, Date == "2007-02-01" | Date == "2007-02-02")

## Set the Graphics Device to quartz
dev.set(3)

## Save the histogram to a png file
png(filename = "plot1.png", width = 480, height = 480, units = "px")

## Create a histogram
hist(data_subsetted$Global_active_power, col= "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## Close the file device
dev.off()
