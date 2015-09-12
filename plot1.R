setwd("~/DataScience/EDA/Project1")
if(!file.exists("./data")){dir.create("./data")}
library(data.table)

data_plots <- read.delim("./data/household_power_consumption.txt",na.strings=c("?"), header=TRUE, sep=";")
data_plots$date2 <- as.Date(data_plots$Date,format="%d/%m/%Y")
##head(data_plots)
##str(data_plots)
##summary(data_plots$date2)

data_plots2 <- subset(data_plots,date2 %between% c("2007-02-01", "2007-02-02"))
str(data_plots2)
data_plots2$GAP <- as.numeric(as.character(data_plots2$Global_active_power))

plot1 <- hist(data_plots2$GAP,col="red",xlab="Global Active Power",main="Global Active Power")

dev.copy(png, file="plot1.png", width = 480, height = 480, units = "px")
dev.off()
