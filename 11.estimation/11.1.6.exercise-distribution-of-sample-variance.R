bunsan <- function(n){
  x<-numeric(1000)
  for(j in 1:1000){
    x[j] <- var(rnorm(n))
  }
  m<-round(mean(x), digits=4)
  v<-round(var(x), digits=4)
  title<-paste(n, "times ave: ", m, " var: ",  v)
  hist(x, prob=TRUE, main=title, xlim=c(0, 4), ylim=c(0, 3))
}

par(mfrow=c(2, 2))
bunsan(5);bunsan(10);bunsan(50);bunsan(100)
par(mfrow=c(1, 1))

