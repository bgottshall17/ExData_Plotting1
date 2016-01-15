##Load Data##

setwd("/Users/bryangottshall/Downloads/")
electric.df<-read.table("household_power_consumption.txt", header=TRUE, sep=";", nrow=110000)



##Subset Data##
electric.df.feb.07<-subset(electric.df, Date %in% c("1/2/2007", "2/2/2007"))



##Create and Format Variables##
electric.df.feb.07$Date.Time<-strptime(paste(electric.df.feb.07$Date, electric.df.feb.07$Time), "%d/%m/%Y %H:%M:%S")
electric.df.feb.07$Global_active_power<-as.numeric(electric.df.feb.07$Global_active_power)


##Create Plot##
plot(electric.df.feb.07$Date.Time, electric.df.feb.07$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##Print##
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


