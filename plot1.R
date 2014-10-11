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
# -- import raw data
data <- read.table("household_power_consumption.txt", 
                   header=TRUE, sep = ";", na.strings = "?", col.names = columndata[,2], 
                   colClasses = columndata[,3])

#-- clean and subset data for use in plotting
data_clean <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# -- Plot to view - remove # to use - remember to size plot window to capture full axes notations 
#hist(data_clean$GActiveP, col = "red", 
           #main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# -- Plot to Export to PNG as plot1.png
png("plot1a.png")
hist(data_clean$GActiveP, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
