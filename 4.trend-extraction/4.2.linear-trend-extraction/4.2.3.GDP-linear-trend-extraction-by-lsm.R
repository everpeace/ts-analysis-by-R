# trend extraction (linear regression) applying sample GDP data.
# reading data.
SNA <- read.csv("../../data/GDPA1980TABLE.csv", header=TRUE)
GDP <- ts(SNA$GDP, start=c(1994, 1), frequency=4)

# chart setting.
par(mfrow=c(2, 1))

# draw GDP data.
plot(GDP, type="l")

# trend extraction by least square method.
time <- seq(1, length(GDP))
kaiki2 <- lm(GDP~time)

# draw extracted trend by red line.
(GDP_trend <- ts(kaiki2$fitted, start=c(1994, 0), frequency=4))
lines(GDP_trend, col=2)

# calculate and draw differences from trend.
(GDP_others <- ts(kaiki2$residuals, start=c(1994, 0), frequency=4))
plot(GDP_others, type="l")
abline(h=0)

