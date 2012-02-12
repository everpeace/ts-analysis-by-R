estimate <- function(x, p){
  n <- length(x); alpha <- (1-p)/2
  ta <- qt((1-alpha), df=(n-1))
  mu <- mean(x); s <- sd(x)
  tL <- mu - ta*(s/sqrt(n))
  tU <- mu + ta*(s/sqrt(n))
  return(c(tL, mu, tU))
}

m <- seq(10, 500, by=20); nn <- length(m)
xL <- numeric(nn); mu <- numeric(nn); xU <-numeric(nn)
for(j in 1:nn){
  x <- rnorm(m[j])
  y <- estimate(x, 0.9)
  xL[j] <- y[1]; mu[j] <- y[2]; xU[j] <- y[3]
}

( result <- cbind(m, xL, mu, xU) )

y1<-min(xL); y2<-max(xU)
ttl<-"confidence interval of 90%"
xlb <- "#n"
plot(m, xU, type="o", col=2, ylim=c(y1, y2), main=ttl, xlab=xlb, ylab="")
lines(m, mu, type="o", col=4);lines(m, xL, type="o", col=2)
abline(h=0)


