#reads the text file into data_hpc
data_hpc <- read.table("household_power_consumption.txt", sep = ";",header=TRUE)

#subsets data_hpc into data_hpc_ss containing files with dates '1/2/2007'or '2/2/2007'
data_hpc_ss <- subset (data_hpc,Date=='1/2/2007'|Date=='2/2/2007')

#converts Global_active_power column from factor to numeric
data_hpc_ss$Global_active_power <- as.numeric(as.character(data_hpc_ss$Global_active_power))

#converts Global_reactive_power column from factor to numeric
data_hpc_ss$Global_reactive_power <- as.numeric(as.character(data_hpc_ss$Global_reactive_power))

#converts Voltage column from factor to numeric
data_hpc_ss$Voltage <- as.numeric(as.character(data_hpc_ss$Voltage))


#converts Sub_metering columns from factor to numeric
data_hpc_ss$Sub_metering_1 <- as.numeric(as.character(data_hpc_ss$Sub_metering_1))
data_hpc_ss$Sub_metering_2 <- as.numeric(as.character(data_hpc_ss$Sub_metering_2))
data_hpc_ss$Sub_metering_3 <- as.numeric(as.character(data_hpc_ss$Sub_metering_3))

#merges columns Date and Type into a new columnd DateTime
data_hpc_ss$DateTime <- strptime(paste(data_hpc_ss$Date, data_hpc_ss$Time), format="%d/%m/%Y %H:%M:%S")

#sets the device to plot4.png
png("plot4.png")

#creates the frame to combine 4 graphics
par(mfrow=c(2,2))

#adds first graphic
with (data_hpc_ss,plot(DateTime,Global_active_power,lwd=2,type="l",xlab="",ylab="Global Active Power"))

#adds second graphic
with (data_hpc_ss,plot(DateTime,Voltage,lwd=2,type="l",xlab="",ylab="Voltage"))

# adds Third graphic
with (data_hpc_ss,plot(DateTime,Sub_metering_1 ,lwd=2,type="l",xlab="",ylab="Energy Sub Metering"))
with (data_hpc_ss,lines(DateTime,Sub_metering_2 ,col="red",lwd=2))
with (data_hpc_ss,lines(DateTime,Sub_metering_3 ,col="blue",lwd=2))
legend("topright",bty="n",legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),lty=c(1,1,1),lwd=c(2,2,2),col=c("black","red","blue"))

# adds fourth graphic
with (data_hpc_ss,plot(DateTime,Global_reactive_power,lwd=1,type="l",xlab="",ylab='Global Reactive Power'))

#closes device
dev.off ()