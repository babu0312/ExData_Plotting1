#preparing dataset
EPC=read.table("household_power_consumption.txt", sep=";", header=TRUE)
EPC$Date = as.Date(EPC$Date,"%d/%m/%Y")
EPCfeb2007=subset(EPC, EPC$Date =="2007-02-01"|EPC$Date=="2007-02-02")
EPCfeb2007$DateTime=strptime(paste(EPCfeb2007$Date,EPCfeb2007$Time),"%Y-%m-%d %H:%M:%S")

#plotting histogram
hist1=hist(as.numeric(EPCfeb2007$Global_active_power),col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power",breaks=seq(0,3705,247),xaxt="n")

axis(side=1, at=seq(0,3705, 988), labels=seq(0,6,2))