setwd("M:/Dropbox/Coursera/DSS - Exploratory Data Analysis/week1/Fhousehold_power_consumption")

if (exists("household_data")){
        
        print("File cached") 
}else{
        print("loading file...")
        household_data<-read.table("household_power_consumption.txt",header=TRUE, sep=";")
        household_data$Global_active_power<-as.numeric(as.character(household_data$Global_active_power))
        household_data$Date<-as.date(household_data$Date, format="%d/%m/%Y")
}

selected_data<-subset(household_data, Date=="1/2/2007" | Date=="2/2/2007")


datetime=strptime(paste(selected_data$Date,selected_data$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

png('plot2.png', height=480, width=480)
plot(datetime,selected_data$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
