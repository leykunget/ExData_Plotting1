
  ## Procedures
  ## 1. read the household_power_consumption.txt file
  ## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
  ## 3. generate a plot of different submetering vs date&time
  
  ## Assumes household_power_consumption.txt file located in working directory
  ## read data

  powerdf <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
  
  ## Create a column in dataframe with date and time merged together
  
  datetime <- strptime(paste(powerdf$Date, powerdf$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  powerdf <- cbind(powerdf, datetime)
  
  ## change class of all columns to correct class
  
  powerdf$Date <- as.Date(powerdf$Date, format="%d/%m/%Y")
  powerdf$Time <- format(powerdf$Time, format="%H:%M:%S")
  powerdf$Global_active_power <- as.numeric(powerdf$Global_active_power)
  powerdf$Global_reactive_power <- as.numeric(powerdf$Global_reactive_power)
  powerdf$Voltage <- as.numeric(powerdf$Voltage)
  powerdf$Global_intensity <- as.numeric(powerdf$Global_intensity)
  powerdf$Sub_metering_1 <- as.numeric(powerdf$Sub_metering_1)
  powerdf$Sub_metering_2 <- as.numeric(powerdf$Sub_metering_2)
  powerdf$Sub_metering_3 <- as.numeric(powerdf$Sub_metering_3)
  
  ## subset data from 2007-02-01 and 2007-02-02
  
  subsetdf <- subset(powerdf, Date == "2007-02-01" | Date =="2007-02-02")
  
 
  ## plot of different Energy submetering vs datetime
  
  png("plot3.png", width=480, height=480)
  with(subsetdf, plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
  lines(subsetdf$datetime, subsetdf$Sub_metering_2,type="l", col= "red")
  lines(subsetdf$datetime, subsetdf$Sub_metering_3,type="l", col= "blue")
  legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
  dev.off()

