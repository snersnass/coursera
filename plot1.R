powerData <- loadPowerData()
globalActivePower = powerData$Global_active_power
hist(globalActivePower, col="red",  main="Global Active Power",
     xlab=("Global Active Power (kilowatts"))

dev.copy(png, file = "plot1.png")
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
  