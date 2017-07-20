# ---
# title: "Plot 1 for EDA assignt 1"
# author: "Paul Atlan"
# date: "2017-07-20"
# output: html_document
# ---

# Link to the assignment:
# `   https://class.coursera.org/exdata-032/human_grading/view/courses/975127/assessments/3/submissions

## Prepare the Data Set
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


## Plot the first graph

png(file="plot1.png",width=480,height=480)
hist(dat[,Global_active_power],main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()