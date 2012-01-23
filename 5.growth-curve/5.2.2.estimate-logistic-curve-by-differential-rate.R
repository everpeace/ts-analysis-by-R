# estimate logistic curve (2)
# by differencial rate

# loading data.
xdata <- read.csv("../data/fukyuritsu6.csv", skip=2, header=TRUE)
microwave <- ts(xdata$microwave, start=c(1958), frequency=1)
x1 <- is.na(microwave)
rate <- microwave[x1==FALSE]
time <- 1:length(rate)

# fitting 
# dy/dt is approximated by log(diff(y))
henka <- diff(log(rate))
rate2 <- rate[-1]
kaiki2 <- lm ( henka ~ rate2)

# obtain k2 and A2
# (1/y)(dy/dt) = k - (k/A)t
(k2 <- kaiki2$coef[1]); (A2 <- -1*k2/kaiki2$coef[2])

# estimate alpha ( by mean value)
my <- mean(rate); mt<- mean(time)
( alpha2 <- ((A2-my)/my)*(exp(k2*mt)) )

# estimated rate
time1 <- 0:(length(rate)+10)
ratehat2 <- A2/(1+alpha2*exp(-1*k2*time1))

ttl <- "esitimation of diffusion (2)"
xl <- c(0, length(time1)); yl<-c(0, 100)
plot(time, rate, xlim=xl, ylim=yl, type="p", xlab="", ylab="%", main=ttl)
lines(time1, ratehat2, type="l", lty=2, col=2)

