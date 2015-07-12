#preparing dataset
EPC=read.table("household_power_consumption.txt", sep=";", header=TRUE)
EPC$Date = as.Date(EPC$Date,"%d/%m/%Y")
EPCfeb2007=subset(EPC, EPC$Date =="2007-02-01"|EPC$Date=="2007-02-02")
EPCfeb2007$DateTime=strptime(paste(EPCfeb2007$Date,EPCfeb2007$Time),"%Y-%m-%d %H:%M:%S")

#preparing plot
plot(EPCfeb2007$DateTime,as.numeric(EPCfeb2007$Sub_metering_1)-2,type="l",xlab="",ylab="Energy sub metering", ylim=c(-1,34), yaxt="n")
lines(EPCfeb2007$DateTime,log(as.numeric(EPCfeb2007$Sub_metering_2)-1),col="red")
lines(EPCfeb2007$DateTime,EPCfeb2007$Sub_metering_3,col="blue")

axis(side=2, at=seq(0,30,10), labels=seq(0,30,10))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))