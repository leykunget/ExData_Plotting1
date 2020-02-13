
  ## Here are the procedures
  ## 1. read the household_power_consumption.txt file
  ## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
  ## 3. generate a plot of global active power vs. datetime
  
  ## Assumes household_power_consumption.txt file located in working directory
  
  ## read data
  powerdf <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
  
  ## Create a column in the data frame with date and time merged together
  datetime <- strptime(paste(powerdf$Date, powerdf$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  powerdf <- cbind(powerdf, datetime)
  
  ## change class of all columns to the appropriate class
  
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
  
  ## plot global active power vs date&time
  png("plot2.png", width=480, height=480)
  with(subsetdf, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
  dev.off()
