setwd("~/Documents/Coursera/04 - Exploratory Data Analysis/04_Projects/04_Proj1")
library(data.table)
# -- import raw data and set dimensions based on data dictionary
columndata <- matrix(c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3",
                "Date", "Time", "GActiveP", "GReactiveP", "Volt", "Intensity", "Sub_1", "Sub_2", "Sub_3",
                "character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric" ), 
                nrow = 9, ncol = 3) #Long names, short names and types
data <- read.table("household_power_consumption.txt", 
                        header=TRUE, sep = ";", na.strings = "?", col.names = columndata[,2], 
                        colClasses = columndata[,3])

#-- clean and subset data for use in plotting
data_clean <- data.table(data)[data$Date == "1/2/2007" | data$Date == "2/2/2007" ]
data_clean[,DateTime:= paste(data_clean$Date, data_clean$Time)]   


             
        

%d%m%Y  %T         