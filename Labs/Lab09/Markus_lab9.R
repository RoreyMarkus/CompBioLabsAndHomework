# Lab 09: Parsing Dates and Times from a Real Data File
#######################################################

#Preliminary Step
install.packages("lubridate")
library(lubridate)
setwd("~/Classes/EBIO4420/compBioHomeworkandLabs/Labs/Lab09/Cusak_et_al")
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)

#Problem 1
tail(camData)

date <- format(as.POSIXct(strptime(camData$DateTime, "%d/%m/%Y %H:%M", tz ="")), format = "%d/%m/%Y")

time <- format(as.POSIXct(strptime(camData$DateTime, "%d/%m/%Y %H:%M", tz ="")), format = "%H:%M")
camData$Dates <- date
camData$Time <- time
camData$DateTime <- NULL

camData$Dates
camData$Time


#Problem 2 