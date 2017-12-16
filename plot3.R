## Read in data file using built-in RStudio functionality

library(readr)
hpc <- read_delim("household_power_consumption.txt", 
                  +     ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y")), 
                  +     trim_ws = TRUE)

## Subset data file to only Feb 1-2, 2007
sub_hpc <- subset(hpc,hpc$Date>='2007-02-01' & hpc$Date<='2007-02-02')

## Create a datetime variable for plotting data
sub_hpc$DateTime <- as.POSIXct(paste(sub_hpc$Date,sub_hpc$Time),format="%Y-%m-%d %H:%M:%S")

## Open connection to output file
png(filename="plot3.png")

## Create chart 
plot(sub_hpc$DateTime,sub_hpc$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")

## Add lines for each of three variables with different colors
lines(sub_hpc$DateTime,sub_hpc$Sub_metering_1)
lines(sub_hpc$DateTime,sub_hpc$Sub_metering_2,col="red")
lines(sub_hpc$DateTime,sub_hpc$Sub_metering_3,col="blue")

## Add legend
legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Close connection
dev.off()