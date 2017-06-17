#reads the text file into data_hpc
data_hpc <- read.table("household_power_consumption.txt", sep = ";",header=TRUE)

#subsets data_hpc into data_hpc_ss containing files with dates '1/2/2007'or '2/2/2007'
data_hpc_ss <- subset (data_hpc,Date=='1/2/2007'|Date=='2/2/2007')

#converts Sub_metering columns from factor to numeric
data_hpc_ss$Sub_metering_1 <- as.numeric(as.character(data_hpc_ss$Sub_metering_1))
data_hpc_ss$Sub_metering_2 <- as.numeric(as.character(data_hpc_ss$Sub_metering_2))
data_hpc_ss$Sub_metering_3 <- as.numeric(as.character(data_hpc_ss$Sub_metering_3))

#merges columns Date and Type into a new columnd DateTime
data_hpc_ss$DateTime <- strptime(paste(data_hpc_ss$Date, data_hpc_ss$Time), format="%d/%m/%Y %H:%M:%S")

#sets the device to plot3.png
png("plot3.png")


# Creates Graphic with sub metering 1 data'
with (data_hpc_ss,plot(DateTime,Sub_metering_1 ,lwd=2,type="l",xlab="",ylab="Energy Sub Metering"))

# Adds line with from sub metering 2 data
with (data_hpc_ss,lines(DateTime,Sub_metering_2 ,col="red",lwd=2))

# Adds line with from sub metering 3 data
with (data_hpc_ss,lines(DateTime,Sub_metering_3 ,col="blue",lwd=2))

#Adds legend
legend("topright",legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),lty=c(1,1,1),lwd=c(2,2,2),col=c("black","red","blue"))

#closes device
dev.off ()
