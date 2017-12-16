## Read in data file using built-in RStudio functionality
library(readr)
hpc <- read_delim("household_power_consumption.txt", 
                    +     ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y")), 
                    +     trim_ws = TRUE)

## Subset data file to only Feb 1-2, 2007
sub_hpc <- subset(hpc,hpc$Date>='2007-02-01' & hpc$Date<='2007-02-02')

## Create and save plot
png(filename="plot1.png")
hist(sub_hpc$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()