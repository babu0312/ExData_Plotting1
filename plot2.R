#preparing dataset
EPC=read.table("household_power_consumption.txt", sep=";", header=TRUE)
EPC$Date = as.Date(EPC$Date,"%d/%m/%Y")
EPCfeb2007=subset(EPC, EPC$Date =="2007-02-01"|EPC$Date=="2007-02-02")
EPCfeb2007$DateTime=strptime(paste(EPCfeb2007$Date,EPCfeb2007$Time),"%Y-%m-%d %H:%M:%S")

#preparing plot
plot(EPCfeb2007$DateTime,as.numeric(EPCfeb2007$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)", yaxt="n")

axis(side=2, at=seq(0,3000, 1000), labels=seq(0,6,2))