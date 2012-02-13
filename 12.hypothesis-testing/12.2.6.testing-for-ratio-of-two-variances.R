# F test to compare two variances
x <- rnorm(20,mean=5,sd=1.5)
y <- rnorm(30,mean=5,sd=1.2)
vx<-var(x)
vy<-var(y)

(FF<- vx/vy)
var.test(x,y)