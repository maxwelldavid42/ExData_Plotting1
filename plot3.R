power<- read.table("household_power_consumption.txt",sep=";", header=TRUE, na.strings="?",stringsAsFactors = F, comment.char = "", quote = '\"')

##Convert power to a DT
power<- data.table(power)

##Add Date_Time column to DT
power_datetime<- (power[,Date_Time := paste(power$Date, power$Time)])

##Set date format for Date_Time
power_datetime$Date_Time<-as.POSIXct(strptime(power_datetime$Date_Time, "%d/%m/%Y %H:%M:%S"))

##Extract subset where date is either Feb 1st or 2nd in the year 2007
power_subset<- subset(power_datetime, subset=(Date_Time >= "2007/02/01 00:00:00" & Date_Time <= "2007/02/03 00:00:00"))

##Set margins to appropriate size to display histogram
par(mar=c(5,4,1,1))

## Generating Plot 3
with(power_subset, {
  plot(Sub_metering_1 ~ Date_Time, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ Date_Time, col = 'Red')
  lines(Sub_metering_3 ~ Date_Time, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
