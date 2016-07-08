setwd("C:/Users/rduvv/Desktop/data/Cotton_Seed_Price")
# data is downloaded from the http://apps.fas.usda.gov/psdonline/psdDownload.aspx and filtered for required values
library(reshape2)
library(xts)
rawYield <- read.csv("threeCountryYield.csv", header = T)
rawArea <- read.csv("threeCountryHarvested.csv", header = T)

yield <- dcast(rawYield, Market_Year ~ Country_Name)
area <- dcast(rawArea, Market_Year ~ Country_Name)
tsareaData <- ts(area, start = 1960, end = 2016, frequency = 1)

?par

par(mfrow=c(2,1))
plot(tsareaData[,2:4], plot.type = "single", col = 1:ncol(tsareaData[,2:4]), lty = c(1:3),lwd = 2, xlab = "Year", ylab = "Hectare(X 1000)")
legend("topleft", colnames(tsareaData[,2:4]), col = 1:1:ncol(tsareaData[,2:4]),lty=c(1:3), lwd =2,  cex=.85)

tsyieldData <- ts(yield, start = 1960, end = 2016, frequency = 1)
plot(tsyieldData[,2:4], plot.type = "single", col = 1:ncol(tsyieldData[,2:4]), lty = c(1:3),lwd = 2, xlab = "Year", ylab = "Yield")
legend("topleft", colnames(tsyieldData[,2:4]), col = 1:1:ncol(tsyieldData[,2:4]),lty=c(1:3), lwd =2,  cex=.85)
