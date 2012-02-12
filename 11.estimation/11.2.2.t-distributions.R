x <- seq(-4, 4, by=0.05)
y1 <- dt(x, df=1); y5 <- dt(x, df=5); y10 <- dt(x, df=10)
yinf <- dnorm(x)
ttl<- "t-distributions ant standard normal distribution"
plot(x, y1, type="l", xlim=c(-4, 4), ylim=c(0, 0.5), main=ttl)
lines(x, y5, col=3)
lines(x, y10, col=4)
lines(x, yinf, col=2)
hanrei <- c("t with df=1", "t with df=5",  "t with df=10", "t with df=inf(std. norm.)")
legend(-4, 0.5, legend=hanrei, lty=c(1, 1, 1, 1), col=c(1, 3, 4, 2))

