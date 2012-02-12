par(mfrow=c(2, 2))
x<-seq(-4, 4, by=0.05)
y<-dnorm(x)

x1<-rnorm(100)
hist1<-hist(x1, prob=TRUE, ylim=c(0, 0.6), main="n=100")
lines(density(x1), lty=2)
lines(x, y, lty=3)

x2<-rnorm(500)
hist2<-hist(x2, prob=TRUE, ylim=c(0, 0.6), main="n=500")
lines(density(x2), lty=2)
lines(x, y, lty=3)

x3<-rnorm(1000)
hist3<-hist(x3, prob=TRUE, ylim=c(0, 0.6), main="n=1000")
lines(density(x3), lty=2)
lines(x, y, lty=3)

x4<-rnorm(10000)
hist4<-hist(x4, prob=TRUE, ylim=c(0, 0.6), main="n=10000")
lines(density(x4), lty=2)
lines(x, y, lty=3)

