average <- function(n){
  x0 <- seq(-2, 2, by=0.02); y0 <- dnorm(x0, sd=1/sqrt(n))
  x <- numeric(1000)
  for(j in 1:1000){
    x[j] <- mean(rnorm(n))
  }
  m <- round(mean(x), digits=4)
  v <- round(var(x), digits=4)
  title <- paste(n, "times,  ave: ", m, " var: ", v)
  hist(x, prob=TRUE, main=title, xlim=c(-2, 2), ylim=c(0, 5))
  lines(x0, y0, col=4)
}

par(mfrow=c(2, 2))
average(5);average(10);average(50);average(100)
par(mfrow=c(1, 1))

