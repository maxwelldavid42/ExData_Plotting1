power<- read.table("household_power_consumption.txt",sep=";", header=TRUE, na.strings="?",stringsAsFactors = F, comment.char = "", quote = '\"')

##Convert power to a DT
power<- data.table(power)

##Add Date_Time column to DT
power_datetime<- (power[,Date_Time := paste(power$Date, power$Time)])

power_datetime$Date<- as.Date(power_datetime$Date, format = "%d/%m/%Y")

##Extract subset where date is either Feb 1st or 2nd in the year 2007

power_subset<- subset(power_datetime, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##head(power_subset)

plot(power_subset$Global_active_power ~ power_subset$Date_Time, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

##Set margins to appropriate size to display histogram
par(mar=c(5,4,1,1))

##Create plot

plot(power_subset$Global_active_power ~ power_subset$Date, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

##power_datetime$Date_Time<- as.Date(power_datetime$Date_Time, format = "%d/%m/%Y %H:%M:%S")
##%H:%M:%S