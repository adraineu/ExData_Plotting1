Plot2

library(data.table)

data_plots <- read.delim("./household_power_consumption.txt", na.strings=c("?"), header=TRUE, sep=";")
data_plots$date2 <- as.Date(data_plots$Date,format="%d/%m/%Y")
##head(data_plots)
##str(data_plots)
##summary(data_plots$date2)

data_plots2 <- subset(data_plots,date2 %between% c("2007-02-01", "2007-02-02"))
data_plots2$GAP <- as.numeric(as.character(data_plots2$Global_active_power))

data_plots2$DateTime = paste(data_plots2$Date, data_plots2$Time)
data_plots2$DateTime = as.POSIXlt(data_plots2$DateTime,format="%d/%m/%Y %H:%M:%S")
data_plots2$day <-  weekdays(data_plots2$date2)
table(data_plots2$day)


plot2 <- plot(data_plots2$DateTime,data_plots2$GAP, type="l",ylab="Global Active Power(kilowatts)",main="",xlab="")
dev.copy(png, file="plot2.png", width = 480, height = 480, units = "px")
dev.off()
