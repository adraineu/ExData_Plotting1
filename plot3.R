##Plot3

library(data.table)

data_plots <- read.delim("./household_power_consumption.txt", na.strings=c("?"), header=TRUE, sep=";")
data_plots$date2 <- as.Date(data_plots$Date,format="%d/%m/%Y")


data_plots2 <- subset(data_plots,date2 %between% c("2007-02-01", "2007-02-02"))
data_plots2$GAP <- as.numeric(as.character(data_plots2$Global_active_power))

data_plots2$DateTime = paste(data_plots2$Date, data_plots2$Time)
data_plots2$DateTime = as.POSIXlt(data_plots2$DateTime,format="%d/%m/%Y %H:%M:%S")
data_plots2$day <-  weekdays(data_plots2$date2)
table(data_plots2$day)


plot3 <- with(data_plots2,{
              plot(DateTime,Sub_metering_1, col="black",type="l",ylab="Energy Sub Metering",main="",xlab="")
              lines(DateTime,Sub_metering_2, col="red",type="l")
              lines(DateTime,Sub_metering_3, col="blue",type="l")
              legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.7)
              
  
})

dev.copy(png, file="plot3.png", width = 480, height = 480, units = "px")
dev.off()
