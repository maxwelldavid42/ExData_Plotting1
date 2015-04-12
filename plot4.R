power<- read.table("household_power_consumption.txt",sep=";", header=TRUE, na.strings="?",stringsAsFactors = F, comment.char = "", quote = '\"')

##Convert power to a DT
power<- data.table(power)

##Add Date_Time column to DT
power_datetime<- (power[,Date_Time := paste(power$Date, power$Time)])


##Set date format for Date_Time
power_datetime$Date_Time<-as.POSIXct(strptime(power_datetime$Date_Time, "%d/%m/%Y %H:%M:%S"))

##Extract subset where date is either Feb 1st or 2nd in the year 2007
power_subset<- subset(power_datetime, subset=(Date_Time >= "2007/02/01 00:00:00" & Date_Time <= "2007/02/03 00:00:00"))


par(mfrow = c(2,2), mar = c(1, 1, 1, 1),oma = c(0, 0, 2, 0))

with(power_subset, {

#plot chart 1
plot(power_subset$Global_active_power ~ power_subset$Date_Time, type = "l",
       ylab = "Global Active Power (kilowatts)", xlab = "")

## create Plot 2
with(power_subset, {
  plot(Sub_metering_1 ~ Date_Time, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ Date_Time, col = 'Red')
  lines(Sub_metering_3 ~ Date_Time, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  
##plot chart 3
plot(power_subset$Voltage ~ power_subset$Date_Time, type = "l",
     ylab = "Voltage", xlab = "datetime")
##plot chart 4
plot(power_subset$Global_reactive_power ~ power_subset$Date_Time, type = "l",
     ylab = "Global_reactive_power", xlab = "datetime")

})