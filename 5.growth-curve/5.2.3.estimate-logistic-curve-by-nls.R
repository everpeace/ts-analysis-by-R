# estimate logistic curve (3)
# by non-linear least square method

# loading data.
xdata <- read.csv("../data/fukyuritsu6.csv", skip=2, header=TRUE)
microwave <- ts(xdata$microwave, start=c(1958), frequency=1)
x1 <- is.na(microwave)
rate <- microwave[x1==FALSE]
time <- 1:length(rate)

# initial value
syokiti <- list(A3=90, alpha3=150, k3=0.3)

# fitting by nls()
fm <- nls ( rate ~ A3/(1+alpha3*exp(-1*k3*time)),trace=TRUE,start=syokiti)
fm

# extract paremeters
(A3 <- coef(fm)[1])
(alpha3 <- coef(fm)[2])
(k3 <- coef(fm)[3])

# estimated rate
time1 <- 0:(length(rate)+10)
ratehat3 <- A3/(1+alpha3*exp(-1*k3*time1))

ttl <- "esitimation of diffusion (3)"
xl <- c(0, length(time1)); yl<-c(0, 100)
plot(time, rate, xlim=xl, ylim=yl, type="p", xlab="", ylab="%", main=ttl)
lines(time1, ratehat3, type="l", lty=2, col=2)
abline(h=A3, lty=3)

