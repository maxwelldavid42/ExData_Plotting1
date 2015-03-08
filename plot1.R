power<- read.table("household_power_consumption.txt",sep=";", header=TRUE, na.strings="?",stringsAsFactors = F, comment.char = "", quote = '\"')
power$Date<- as.Date(power$Date, format = "%d/%m/%Y")

##Extract subset where date is either Feb 1st or 2nd in the year 2007

power_subset<- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


##Set margins to appropriate size to display histogram
par(mar=c(5,4,1,1))

##Create histogram

hist(power_subset$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")