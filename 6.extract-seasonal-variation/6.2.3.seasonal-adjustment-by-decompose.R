# seasonally adjusting for GDP data
SNA <- read.csv("../data/GDPO1980TABLE.csv", skip=2, header=TRUE)
GDP <- ts(SNA$GDP, start=c(1980,1), frequency=4)
(bunkai1 <- decompose(GDP, type="multiplicative"))
plot(bunkai1)
