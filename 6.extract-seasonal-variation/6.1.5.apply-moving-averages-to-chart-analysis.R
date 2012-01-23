#loading data
xdata <- read.csv("../data/NITTETSU.csv",skip=2,header=TRUE)
NI <- ts(xdata$NITTETSU, start=c(1),frequency=1)

# calculate 200-day moving average
w200 <- rep(1,200)/200
H200 <- filter(NI,filter=w200,sides=1)

#plotting
ttl <- "stock value of SHINNITETSU and its 200-day moving average"
sb <- "2006/01/04 -- 2007/12/10"
ts.plot(NI,H200,type="l",main=ttl,sub=sb,lty=c(1,2),xlab="",ylab="yen")
