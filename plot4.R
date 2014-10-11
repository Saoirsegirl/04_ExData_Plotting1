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

# -- Export plot to png -- to view plot use ### on line 26 & 45 then run
png("plot4.png")
# --- set 2 x 2 grid
par(mfrow = c(2, 2), mar = c(4, 4, 4, 2))
# -----plot upper-left ----
plot(x=data_clean$DateTime, y=data_clean$GActiveP, type = "l", xlab ="",
     ylab = "Global Active Power" )
# -----plot uper-right ----
plot(x=data_clean$DateTime, y=data_clean$Volt, type = "l", xlab ="datetime",
     ylab = "Voltage" )
# -----plot lower-left ----
plot(plot3.1, type = "l", xlab ="", ylab = "Energy sub metering") 
lines(plot3.2, col = "red")
lines(plot3.3, col = "blue")
legend("topright", bty = "n", lwd = 2, col = c("black", "red", "blue"), 
      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .9)
# ----- plot lower-right ----
plot(x=data_clean$DateTime, y=data_clean$GReactiveP, type = "l", xlab ="datetime",
     ylab = "Global_Reactive_Power" )

dev.off()

