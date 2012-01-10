# trend extraction (linear regression) applying sample GDP data.
# reading data.
SNA <- read.csv("../../data/GDPA1980TABLE.csv", header=TRUE)
GDP <- ts(SNA$GDP, start=c(1994, 1), frequency=4)
# log(GDP)
LoggedGDP <- log(GDP)

# chart setting.
par(mfrow=c(3, 1))

# trend extraction by least square method.
# perform lsm to logged GDP. i.e. hypothesis = exp(b+at)
time <- seq(1, length(LoggedGDP))
(kaiki3 <- lm(LoggedGDP~time))

# draw extracted trend by red line.
(LoggedGDP_trend <- ts(kaiki3$fitted, start=c(1994, 0), frequency=4))
ts.plot(GDP, exp(LoggedGDP_trend), type="l", col=c(1, 2), ylab="GDP")

# calculate and draw ratios between actual GDP and trend.
(GDP_others <- ts(kaiki3$residuals, start=c(1994, 0), frequency=4))
plot(exp(GDP_others), type="l", ylab="GDP/trend")
abline(h=1)

