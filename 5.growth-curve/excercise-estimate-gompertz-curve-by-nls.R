# estimate gompertz curve
# by non-linear least square method

# loading data.
xdata <- read.csv("../data/fukyuritsu6.csv", skip=2, header=TRUE)
microwave <- ts(xdata$microwave, start=c(1958), frequency=1)
x1 <- is.na(microwave)
rate <- microwave[x1==FALSE]
time <- 1:length(rate)

# initial value
syokiti <- list(A=1, alpha=0.0001, beta=0.0001)

# fitting by nls()
fm <- nls ( rate ~ A*alpha^(beta^time),trace=TRUE,start=syokiti)
fm

# extract paremeters
(A <- coef(fm)[1])
(alpha <- coef(fm)[2])
(beta <- coef(fm)[3])

# estimated rate
time1 <- 0:(length(rate)+10)
ratehat <- A*alpha^(beta^time1)

ttl <- "esitimation of diffusion (3)"
xl <- c(0, length(time1)); yl<-c(0, 100)
plot(time, rate, xlim=xl, ylim=yl, type="p", xlab="", ylab="%", main=ttl)
lines(time1, ratehat, type="l", lty=2, col=2)
abline(h=A, lty=3)

