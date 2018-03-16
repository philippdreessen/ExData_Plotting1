setwd("M:/Dropbox/Coursera/DSS - Exploratory Data Analysis/week1/Fhousehold_power_consumption")

if (exists("household_data")){
        
        print("File cached") 
}else{
        print("loading file...")
        household_data<-read.table("household_power_consumption.txt",header=TRUE, sep=";")
        household_data$Global_active_power<-as.numeric(as.character(household_data$Global_active_power))
        household_data$Sub_metering_1<-as.numeric(as.character(household_data$Sub_metering_1))
        household_data$Sub_metering_2<-as.numeric(as.character(household_data$Sub_metering_2))
        household_data$Sub_metering_3<-as.numeric(as.character(household_data$Sub_metering_3))
        household_data$Date<-as.date(household_data$Date, format="%d/%m/%Y")
}

#household_data$Sub_metering_1<-as.character(as.numeric(household_data$Sub_metering_1))

selected_data<-subset(household_data, Date=="1/2/2007" | Date=="2/2/2007")


datetime=strptime(paste(selected_data$Date,selected_data$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

png('plot3.png', height=480, width=480)
plot(datetime,selected_data$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(datetime,selected_data$Sub_metering_2, type="l",col="red")
lines(datetime,selected_data$Sub_metering_3, type="l",col="blue")
dev.off()
