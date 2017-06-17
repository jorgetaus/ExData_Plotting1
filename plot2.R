#reads the text file into data_hpc
data_hpc <- read.table("household_power_consumption.txt", sep = ";",header=TRUE)

#subsets data_hpc into data_hpc_ss containing files with dates '1/2/2007'or '2/2/2007'
data_hpc_ss <- subset (data_hpc,Date=='1/2/2007'|Date=='2/2/2007')

#converts Global_active_power column from factor to numeric
data_hpc_ss$Global_active_power <- as.numeric(as.character(data_hpc_ss$Global_active_power))

#merges columns Date and Type into a new columnd DateTime
data_hpc_ss$DateTime <- strptime(paste(data_hpc_ss$Date, data_hpc_ss$Time), format="%d/%m/%Y %H:%M:%S")

#sets the device to plot2.png
png("plot2.png")

#creates the graphic
with (data_hpc_ss,plot(DateTime,Global_active_power,lwd=2,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

#closes device
dev.off ()