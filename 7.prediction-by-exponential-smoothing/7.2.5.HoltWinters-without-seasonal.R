SNA <- read.csv("../data/GDPO1980TABLE.csv", skip=2, header=TRUE)
GDP <- ts(SNA$GDP, start=c(1980,1), frequency=4)

bunkai1<-decompose(GDP,type="multiplicative")
GDPTCI <- GDP/bunkai1$seasonal

(GDP.HW2 <- HoltWinters(GDPTCI,gamma=0))
(GDP.HW2$fitted)

FITTED2 <- GDP.HW2$fitted[,1]
ts.plot(GDPTCI,FITTED2,type="l",lty=c(1:2),col=c(1:2))
