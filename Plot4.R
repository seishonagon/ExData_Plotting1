# ---
# title: "Plot 4 for A1 EDA"
# author: "Paul Atlan"
# date: "2017-07-20"
# output: html_document
# ---
# 
# Link to the assignment:
# `   https://class.coursera.org/exdata-032/human_grading/view/courses/975127/assessments/3/submissions

## Prepare the Data Set
# ```{r, cache=TRUE, echo=FALSE, warning=FALSE}
# prepare to use data.tables and lubridate (for POSIXct date-time manipulations)
library(data.table)
library(lubridate)
# set up the dates we want to filter
dates <- c("1/2/2007","2/2/2007")
# read the data.
file <- "./data/household_power_consumption.txt"
DT <- data.table(read.table(file, header=T, sep=";", na.strings = "?",nrows=2076000))
# filter the data to the dates in question
dat <- DT[is.element(Date,dates),]
# concatenate the Date and Time strings
dat[,datetime:=paste(Date,Time)]
# convert the datetime data from strings to POSIXlt and POSIXct 
dat[,datetime:=dmy_hms(datetime)]

# ```


## Plot the fourth graph
# ```{r,cache=TRUE,echo=FALSE}
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
# plot 1,1
plot(dat[,.(datetime,Global_active_power)],type="l",main="",ylab="Global Active Power",xlab="")
# plot(1,2)
plot(dat[,.(datetime,Voltage)],type="l",main="",ylab="Voltage",col="black")
# plot(2,1)
plot(dat[,.(datetime,Sub_metering_1)],type="l",main="",ylab="Energy Sub Metering ",xlab="",col="black")
lines(dat[,.(datetime,Sub_metering_2)],col="red",xlab="")
lines(dat[,.(datetime,Sub_metering_3)],col="blue",xlab="")
legend("topright", col = c("black","blue", "red"), legend = c("Sub_Metering_1", "Sub_Metering_2","Sub_Metering_3"),bty="n",lty=1)
#plot(2,2)
plot(dat[,.(datetime,Global_reactive_power)],type="l",main="",col="black")
dev.off()
# ```
