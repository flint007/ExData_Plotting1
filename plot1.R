#read from the url then decompress
input <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dest <- "household_power_consumption.zip"
if (!file.exists(dest)) {
    #temp <- tempfile()
    download.file(input, dest, "curl")
    #unlink(temp)
}
if (!file.exists("household_power_consumption.txt")) {
    untar(dest)
}
data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
#Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3
#16/12/2006;17:24:00;4.216;0.418;234.840;18.400;0.000;1.000;17.000
x <- paste(data[,1], data[,2])
data$date2 <- as.Date(strptime(x, "%d/%m/%Y %H:%M:%S"))
dat <- subset(data, date2 > as.Date("2007-02-01") & date2 < as.Date("2007-02-03"))
hist(as.numeric(dat$Global_active_power))