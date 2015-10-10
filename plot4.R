powerData <- loadPowerData()


windows(bg="white")
par(mfrow=c(2,2))
# graph1
plot(powerData$DateTime, powerData$Global_active_power, type = "o", pch="",  
     ylab="Global Active Power", xlab="")


# graph2
plot(powerData$DateTime, powerData$Voltage, type = "o", pch="",  
     ylab="Voltage", xlab="datetime")


# graph3
plot(powerData$DateTime, powerData$Sub_metering_1, type = "o", pch="",  
     ylab="Energy sub metering", xlab="", 
     cex.lab=0.75, cex.axis = 0.75)
lines(powerData$DateTime, powerData$Sub_metering_2, col = "red")
lines(powerData$DateTime, powerData$Sub_metering_3, col = "blue")

legend("topright","groups", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red","blue"), lwd=1, bty="n")

#graph4
plot(powerData$DateTime, powerData$Global_reactive_power, type = "o", pch="",
     ylab="Global_reactive_power", xlab="datetime")


dev.copy(png, file = "plot4.png")

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
