# loading data
xdata <- read.csv("../data/IIPO1978.csv",skip=2,header=TRUE)
IIP <- ts(xdata$IIP,start=c(1978,1),frequency=12)

# various weights
w3 <- rep(1,3)/3; w7<- rep(1,7)/7; w13 <- rep(1,13)/13
w25<- rep(1,25)/25; w49<- rep(1,49)/49

# various moving averages
IIP3 <- filter(IIP,filter=w3,sides=2)
IIP7 <- filter(IIP,filter=w7,sides=2)
IIP13 <-filter(IIP,filter=w13,sides=2)
IIP25 <- filter(IIP,filter=w25,sides=2)
IIP49 <- filter(IIP,filter=w49,sides=2)

#draw
par(mfrow=c(3,2))
ts.plot(IIP,type="l",main="original")
ts.plot(IIP3,type="l",main="3-term moving average")
ts.plot(IIP7,type="l",main="7-term moving average")
ts.plot(IIP13,type="l",main="13-term moving average")
ts.plot(IIP25,type="l",main="25-term moving average")
ts.plot(IIP49,type="l",main="49-term moving average")
par(mfrow=c(1,1))
