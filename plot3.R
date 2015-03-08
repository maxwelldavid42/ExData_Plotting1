power<- read.table("household_power_consumption.txt",sep=";", header=TRUE, na.strings="?",stringsAsFactors = F, comment.char = "", quote = '\"')

##Convert power to a DT
power<- data.table(power)

##Convert date
power$Date<- as.Date(power$Date, format = "%d/%m/%Y")

##Slows down performance not sure about error
##power$Time<- strptime(power$Time, format= "%H:%M:%S")

##Add Date_Time column to DT
power_datetime<- (power[,Date_Time := paste(power$Date, power$Time)])

)

##Extract subset where date is either Feb 1st or 2nd in the year 2007
power_subset<- subset(power_datetime, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Set margins to appropriate size to display histogram
par(mar=c(5,4,1,1))

## Generating Plot 3
with(power_subset, {
  plot(Sub_metering_1 ~ Date_Time, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ Date_Time, col = 'Red')
  lines(Sub_metering_3 ~ Date_Time, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))