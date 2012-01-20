xdata <- read.csv("../data/fukyuritsu6.csv", skip=2, header=TRUE)
microwave <- ts(xdata$microwave, start=c(1958), frequency=1)

x1 <- is.na(microwave)
rate <- microwave[x1==FALSE]

# assume A == 100
A <- 100

time <- 1:length(rate)
z <- log((A-rate)/rate); (kaiki1 <- lm(z~time))

(k1 <- -1*kaiki1$coef[2]); (alpha1 <- exp(kaiki1$coef[1]))
time1 <- 0:(length(rate)+10)
ratehat1 <- A/(1+alpha1*exp(-1*k1*time1))

ttl<- "電子レンジの普及率(1)"
xl <- c(0, length(time1)); yl<-c(0, 100)
plot(time, rate, xlim=xl, ylim=yl, type="p", xlab="", ylab="%", main=ttl)
lines(time1, ratehat1, type="l", lty=2, col=2)

