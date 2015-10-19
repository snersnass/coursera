
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#   Using the base plotting system, make a plot showing 
#   the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.


# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?


loadPollutantData <- function() {
  
setwd("C:\\Users\\PC\\Documents\\R\\coursera\\Exploratory Data Analysis")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("exdata_data_NEI_data\\summarySCC_PM25.rds")
SCC <- readRDS("exdata_data_NEI_data\\Source_Classification_Code.rds")

poll <- merge(NEI, SCC, by="SCC", all.x = TRUE, all.y=FALSE)

str(NEI)
str(SCC)
str(poll)

# fips: A five-digit number (represented as a string) indicating the U.S. county
# SCC: The name of the source as indicated by a digit string (see source code classification table)
# Pollutant: A string indicating the pollutant
# Emissions: Amount of PM2.5 emitted, in tons
# type: The type of source (point, non-point, on-road, or non-road)
# year: The year of emissions recorded
}