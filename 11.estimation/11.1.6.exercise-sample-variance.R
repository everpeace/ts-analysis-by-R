kai2 <- function(n){
  x0 <- seq(1, 50, by=0.05); y0 <- dchisq(x0, df=(n-1))
  x <- numeric(1000)
  for(j in 1:1000){
    x[j] <- var(rnorm(n))*(n-1)
  }
  m <- round(mean(x), digits=2)
  v <- round(var(x), digits=2)
  title <- paste(n, "times ave: ", m, " var: ", v)
  hist(x, prob=TRUE, main=title, xlim=c(0, 50), ylim=c(0, 0.2))
  lines(x0, y0)
}

par(mfrow=c(2, 2))
kai2(5);kai2(10);kai2(20);kai2(30)
par(mfrow=c(1, 1))

