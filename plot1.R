
#reads the text file into data_hpc
data_hpc <- read.table("household_power_consumption.txt", sep = ";",header=TRUE)

#subsets data_hpc into data_hpc_ss containing files with dates '1/2/2007'or '2/2/2007'
data_hpc_ss <- subset (data_hpc,Date=='1/2/2007'|Date=='2/2/2007')

#converts Global_active_power column from factor to numeric
data_hpc_ss$Global_active_power <- as.numeric(as.character(data_hpc_ss$Global_active_power))

#sets the device to plot1.png
png("plot1.png")

#creates histogram
with(data_hpc_ss,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))

#closes device
dev.off ()
