SNA <- read.csv("../data/GDPO1980TABLE.csv", skip=2, header=TRUE)
GDP <- ts(SNA$GDP, start=c(1980,1), frequency=4)


(GDP.HW1 <- HoltWinters(GDP,seasonal="mult"))
(GDP.HW1$fitted)
FITTED1 <- GDP.HW1$fitted[,1]
(YOSOKU1 <- predict(GDP.HW1,n.ahead=12))

bunkai1<-decompose(GDP,type="multiplicative")
GDPTCI <- GDP/bunkai1$seasonal
(GDP.HW2 <- HoltWinters(GDPTCI,gamma=0))
(GDP.HW2$fitted)
(YOSOKU2 <- predict(GDP.HW2,n.ahead=12))

oldpar <-par(no.readonly=TRUE)
par(mfrow=c(2,1))
ttl<-"prediction by HoltWinters method"
ts.plot(GDP,YOSOKU1,type="l",lty=c(1:2),main=ttl,xlab="")
ttl = "prediction by HoltWinters without seasonal variation"
ts.plot(GDPTCI,YOSOKU2,type="l",lty=c(1:2),main=ttl,xlab="")
par(mfrow=c(1,1));par(oldpar)

