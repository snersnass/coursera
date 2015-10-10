powerData <- loadPowerData()
library(lubridate)

# type = "0" makes it a line graph
# pch = "" makes it have no marker for the point
# cex. = the font size for labels and scale values
windows(bg="white")
plot(powerData$DateTime, powerData$Sub_metering_1, type = "o", pch="",  
     ylab="Energy sub metering", xlab="", 
     cex.lab=0.75, cex.axis = 0.75)

# Add the second and third lines
lines(powerData$DateTime, powerData$Sub_metering_2, col = "red")
lines(powerData$DateTime, powerData$Sub_metering_3, col = "blue")

# Add the legend
# lwd = line width, cex = font size
legend("topright","groups", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red","blue"),
        cex=0.75, lwd=1)

dev.copy(png, file = "plot3.png")

dev.off()


loadPowerData <- function() {
  setwd("~/GitRepo/BigData/ExData_Plotting1")
  # Limiting rows read to make it quicker to load
  # read the headers separately to allow skipping rows
  headerSet <- unlist(read.table("data\\household_power_consumption.txt", 
                                 header=FALSE, nrows=1, sep=";"))
  classSet <- append( rep("numeric", times=6), c("character", "character"), after=0)
  rawDataSet <- read.table("data\\household_power_consumption.txt", 
                           header=FALSE, skip=60000, nrows=80000, sep=";",
                           na.strings=c(" ","?"),
                           colClasses=classSet, col.names=headerSet)
  library(dplyr)
  dataTable <- tbl_df(rawDataSet)
  dataTable <- filter(dataTable, Date == "1/2/2007"| Date == "2/2/2007")
  dataTable$DateTime <- strptime(paste(dataTable$Date, dataTable$Time), format="%d/%m/%Y %H:%M:%S")
  dataTable
}
