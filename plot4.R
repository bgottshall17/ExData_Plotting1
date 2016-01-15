##Load Data##

setwd("/Users/bryangottshall/Downloads/")
electric.df<-read.table("household_power_consumption.txt", header=TRUE, sep=";", nrow=110000)



##Subset Data##
electric.df.feb.07<-subset(electric.df, Date %in% c("1/2/2007", "2/2/2007"))
head(electric.df.feb.07)

##Create and Format Variables##
electric.df.feb.07$Date.Time<-strptime(paste(electric.df.feb.07$Date, electric.df.feb.07$Time), format="%d/%m/%Y %H:%M:%S")
electric.df.feb.07$Global_active_power<-as.numeric(electric.df.feb.07$Global_active_power)
electric.df.feb.07$Global_reactive_power<-as.numeric(electric.df.feb.07$Global_reactive_power)
electric.df.feb.07$Voltage<-as.numeric(electric.df.feb.07$Voltage)
electric.df.feb.07$Sub_metering_1<-as.numeric(electric.df.feb.07$Sub_metering_1)
electric.df.feb.07$Sub_metering_2<-as.numeric(electric.df.feb.07$Sub_metering_2)
electric.df.feb.07$Sub_metering_3<-as.numeric(electric.df.feb.07$Sub_metering_3)

##Create Plots##
par(mfrow=c(2,2))

plot(electric.df.feb.07$Date.Time, electric.df.feb.07$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(electric.df.feb.07$Date.Time, electric.df.feb.07$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(electric.df.feb.07$Date.Time, electric.df.feb.07$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(electric.df.feb.07$Date.Time, electric.df.feb.07$Sub_metering_2, type="l", col="red")
lines(electric.df.feb.07$Date.Time, electric.df.feb.07$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")

plot(electric.df.feb.07$Date.Time, electric.df.feb.07$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

##Print##
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

