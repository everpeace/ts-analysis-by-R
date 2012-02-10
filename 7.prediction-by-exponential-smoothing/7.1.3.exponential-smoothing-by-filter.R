SNA <- read.csv("../data/GDPO1980TABLE.csv", skip=2, header=TRUE)
GDP <- ts(SNA$GDP, start=c(1980,1), frequency=4)
bunkai1 <- decompose(GDP,type="multiplicative")
GDPTC <- bunkai1$trend
GDPTC2 <- GDPTC[is.na(GDPTC)==FALSE]
GDPTC3 <- ts(GDPTC2,start=c(1980,3),frequency=4)
n <- length(GDPTC3)
x <- rep(0,13); b <- 0.7; p <- 20;
( w <- (1-b)*( cumprod(c(1,rep(b,p-1))) ) )
(sum(w))

GDPINT <- rev( GDPTC3[(n-p+1):n] )
YOSOKU <- filter(x,filter=w,method="recursive",init=GDPINT)
YOSOKU2 <- ts(YOSOKU,start=c(2005,1), frequency=4)
ts.plot(GDPTC3,YOSOKU2,type="l",lty=c(1,2))
