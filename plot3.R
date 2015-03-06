plot3 <- function() {
        
# This program assumes that you have downloaded the data from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip, 
# have unzipped the file and placed it in "./data" from the working directory under the name
# household_power_consumption.txt.
# 1.- Reads full data into R (246.1 Mb), selects those dates from 1/2/2007 to
# 2/2/2007, and change variables Date and Time to Date/Time variables. 
        
        powerc <- read.table("./data/household_power_consumption.txt", 
                             header= TRUE, na.strings="?",
                             sep=";", stringsAsFactors=FALSE)
        data <- powerc[(powerc$Date=="1/2/2007" | powerc$Date=="2/2/2007"),]
        data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
        
# 2.- Build the graph and save it into a PNG format under the name plot3.PNG. 
        
        Sys.setlocale("LC_TIME", "English")
        png(file = "plot3.png",width = 480,height = 480)
        with(data, plot(DateTime,Sub_metering_1,xlab="", 
                        ylab="Energy sub metering",type= "n"))
        with(data, points(DateTime, Sub_metering_1, col = "black",type="l"))
        with(data, points(DateTime, Sub_metering_2, col = "red",type="l"))
        with(data, points(DateTime, Sub_metering_3, col = "blue",type="l"))
        legend("topright", lwd=1, col = c("black","blue", "red"), 
                legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
        dev.off()
        
}