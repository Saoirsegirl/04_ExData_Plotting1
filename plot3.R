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
data_clean$DateTime <- strptime(paste(data_clean$Date, data_clean$Time), 
                                format = "%d/%m/%Y %H:%M:%S")
plot3.1 <- data_clean[,c(10,7)]
plot3.2 <- data_clean[,c(10,8)]
plot3.3 <- data_clean[,c(10,9)]

# -- Plot to view - remember to size plot window to capture full axes notations
#plot(plot3.1, type = "l", xlab ="", ylab = "Energy sub metering") 
#lines(plot3.2, col = "red")
#lines(plot3.3, col = "blue")
#legend("topright", lwd = 2, col = c("black", "red", "blue"), 
 #      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# -- Plot to Export to PNG as plot1.png
png("plot3a.png")
plot(plot3.1, type = "l", xlab ="", ylab = "Energy sub metering") 
lines(plot3.2, col = "red")
lines(plot3.3, col = "blue")
legend("topright", lwd = 2,col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

