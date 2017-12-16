## Read in data file using built-in RStudio functionality

library(readr)
hpc <- read_delim("household_power_consumption.txt", 
                  +     ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y")), 
                  +     trim_ws = TRUE)

## Subset data file to only Feb 1-2, 2007
sub_hpc <- subset(hpc,hpc$Date>='2007-02-01' & hpc$Date<='2007-02-02')

## Create a datetime variable for plotting data
sub_hpc$DateTime <- as.POSIXct(paste(sub_hpc$Date,sub_hpc$Time),format="%Y-%m-%d %H:%M:%S")

## Create and save plot
png(filename="plot2.png")
plot(sub_hpc$DateTime,sub_hpc$Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(sub_hpc$DateTime,sub_hpc$Global_active_power)
dev.off()