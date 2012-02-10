SNA <- read.csv("../data/GDPO1980TABLE.csv", skip=2, header=TRUE)
GDP <- ts(SNA$GDP, start=c(1980,1), frequency=4)
bunkai1 <- decompose(GDP,type="multiplicative")
GDPTC <- bunkai1$trend
GDPTC2 <- GDPTC[is.na(GDPTC)==FALSE]
GDPTC3 <- ts(GDPTC2,start=c(1980,3),frequency=4)
n <- length(GDPTC3)
b <- 0.7; w <- b;
x <- (1-b)*GDPTC3[-1]
GDPHAT <- filter(x,filter=w,method="recursive",init=GDPTC3[1])
GDPhat <- ts(GDPHAT,start=c(1980,4),frequency=4)
ts.plot(GDPTC3,GDPhat,type="l",lty=c(1,2))
