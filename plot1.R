#read from the url then decompress
input <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dest <- "household_power_consumption.zip"
if (!file.exists(dest)) {
    #temp <- tempfile()
    download.file(input, dest, "curl")
}
if (!file.exists("household_power_consumption.txt")) {
    untar(dest)
}
data <- read.table("household_power_consumption.txt")
#unlink(temp)
