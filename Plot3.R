##Load Data##

setwd("/Users/bryangottshall/Downloads/")
electric.df<-read.table("household_power_consumption.txt", header=TRUE, sep=";", nrow=110000)



##Subset Data##
electric.df.feb.07<-subset(electric.df, Date %in% c("1/2/2007", "2/2/2007"))
head(electric.df.feb.07)

##Create and Format Variables##
electric.df.feb.07$Date.Time<-strptime(paste(electric.df.feb.07$Date, electric.df.feb.07$Time), format="%d/%m/%Y %H:%M:%S")
electric.df.feb.07$Global_active_power<-as.numeric(electric.df.feb.07$Global_active_power)
electric.df.feb.07$Sub_metering_1<-as.numeric(electric.df.feb.07$Sub_metering_1)
electric.df.feb.07$Sub_metering_2<-as.numeric(electric.df.feb.07$Sub_metering_2)
electric.df.feb.07$Sub_metering_3<-as.numeric(electric.df.feb.07$Sub_metering_3)

##Create Plot##
plot(electric.df.feb.07$Date.Time, electric.df.feb.07$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(electric.df.feb.07$Date.Time, electric.df.feb.07$Sub_metering_2, type="l", col="red")
lines(electric.df.feb.07$Date.Time, electric.df.feb.07$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

##Print##
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

