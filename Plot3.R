# ---
# title: "Plot 3 for A1/EDA"
# author: "Paul Atlan"
# date: "9 Sep 2015"
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

## Plot the third graph
# ```{r,cache=TRUE,echo=FALSE}
png(file="plot3.png",width=480,height=480)
plot(dat[,.(datetime,Sub_metering_1)],type="l",main="",ylab="Energy Sub Metering ",xlab="",col="black")
lines(dat[,.(datetime,Sub_metering_2)],col="red")
lines(dat[,.(datetime,Sub_metering_3)],col="blue")
legend("topright", col = c("black","blue", "red"), legend = c("Sub_Metering_1", "Sub_Metering_2","Sub_Metering_3"),lty=1)
dev.off()
# ```