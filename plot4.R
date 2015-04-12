par(mfrow = c(1,1), mar=(4,4,2,1))

with(power_subset, {

##plot chart 1
plot(power_subset$Global_active_power ~ power_subset$Date_Time, type = "l",
       ylab = "Global Active Power (kilowatts)", xlab = "")

  
  
##plot chart 3
plot(power_subset$Voltage ~ power_subset$Date_Time, type = "l",
     ylab = "Voltage", xlab = "datetime")
##plot chart 4
plot(power_subset$Global_reactive_power ~ power_subset$Date_Time, type = "l",
     ylab = "Global_reactive_power", xlab = "datetime")

})