setwd("~/Documents/Coursera/04-ExploratoryDataAnalysis/04_Projects/04_Proj1")
# -- set dimensions based on data dictionary
columndata <- matrix(c("Date", "Time", "Global_active_power", 
                       "Global_reactive_power", "Voltage", "Global_intensity",
                       "Sub_metering_1", "Sub_metering_2", "Sub_metering_3",   #Full_names
                       "Date", "Time", "GActiveP", "GReactiveP", "Volt", 
                       "Intensity", "Sub_1", "Sub_2", "Sub_3",                 #Short_names
                       "character","character","numeric","numeric","numeric",
                       "numeric","numeric","numeric","numeric" ),              #classes
                     nrow = 9, ncol = 3)

# -- import raw data - File size after import = 133MB
data <- read.table("household_power_consumption.txt", 
                   header=TRUE, sep = ";", na.strings = "?", col.names = columndata[,2], 
                   colClasses = columndata[,3])

#-- clean and subset data for use in plotting
data_clean <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data_clean$DateTime <- strptime(paste(data_clean$Date, data_clean$Time), format = "%d/%m/%Y %H:%M:%S")

# -- Plot to view - remember to size plot window to capture full axes notations
quartz(title='plot')
plot(x=data_clean$DateTime[,1], y=data_clean$sub_1, type = "l", xlabel ="",
  ylabel = "Energy sub metering") 

# -- Plot to Export to PNG as plot1.png
png("plot3.png")
plot(x=data_clean$DateTime, y=data_clean$GActiveP, type = "l", xlab ="",
     ylab = "Global Active Power (kilowatts)" )
dev.off()

