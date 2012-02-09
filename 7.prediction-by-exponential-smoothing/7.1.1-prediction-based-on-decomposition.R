SNA <- read.csv("../data/GDPO1980TABLE.csv", skip=2, header=TRUE)
GDP <- ts(SNA$GDP, start=c(1980,1), frequency=4)
(bunkai1 <- decompose(GDP, type="multiplicative"))

#prediction using trend
GDPTC <- bunkai1$trend
n <- length(GDPTC); time1 <- seq(1:n)
kaiki1 <- lm(GDPTC~time1)
TRND1 <- ts(kaiki1$fitted,, start=c(1980,1),frequency=4)
alpha <- kaiki1$coef[1]; beta1 <- kaiki1$coef[2]
time2 <- seq(n-1,n+12)
Yhat <- ts((alpha+beta1*time2),start=c(2005,1),frequency=4)

par(mfrow=c(2,1))
ttl<-"prediction by linear regressioned trend"
ts.plot(GDPTC,TRND1,Yhat,type="l",lyc=c(1:3),main=ttl,xlab="year")

# generate prediction using by seasonal exponential coefficient
ss <- bunkai1$figure; sss<-c(ss[3],ss[4],ss[1],ss[2])
Yhat2 <- ts(c(TRND1,Yhat)*sss,start=c(1980,3),frequency=4)
ttl2 <- "case of adding seaonal variation"
ts.plot(GDP,Yhat2,type="l",lty=c(1,2),main=ttl2,xlab="year")
par(mfrow=c(1,1))
