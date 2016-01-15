##Load Data##

setwd("/Users/bryangottshall/Downloads/")
electric.df<-read.table("household_power_consumption.txt", header=TRUE, sep=";", nrow=110000)


##Convert Date and Time Variables to appropriate formats##
electric.df$Date<-as.Date(electric.df$Date, "%d/%m/%Y")
head(electric.df)

##Subset Data##
electric.df.feb.07<-subset(electric.df, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))


##Create Plot##
par(mfrow=c(1,1))
electric.df.feb.07$Global_active_power<-as.numeric(electric.df.feb.07$Global_active_power)
hist(electric.df.feb.07$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequnecy")

##Print##
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
