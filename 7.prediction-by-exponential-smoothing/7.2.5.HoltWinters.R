SNA <- read.csv("../data/GDPO1980TABLE.csv", skip=2, header=TRUE)
GDP <- ts(SNA$GDP, start=c(1980,1), frequency=4)

(GDP.HW1 <- HoltWinters(GDP,seasonal="mult"))
(GDP.HW1$fitted)

FITTED1 <- GDP.HW1$fitted[,1]
ts.plot(GDP,FITTED1,type="l",lty=c(1:2),col=c(1:2))
