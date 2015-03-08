library(data.table)
newFile <- fread("course_4_proj_1.txt", na.strings = "?")
##This is from Data.Table package
newFile[,DateTime := as.Date(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


library(dplyr)
subsetted <- filter(newFile, DateTime >= as.Date("2006-02-01 00:00:00"), DateTime < as.Date("2006-02-03 00:00:00"))