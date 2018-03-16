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



png('plot1.png', height=480, width=480)
hist(selected_data$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


        
        