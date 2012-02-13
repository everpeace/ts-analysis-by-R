# Two Sample t-testing by t.test()
x <- rnorm(20,mean=2.5,sd=sqrt(2))
y<- rnorm(30,mean=2,sd=sqrt(2))
(t.test(x,y,alternative="greater",var.equal=TRUE))

# One Sample t-testing by t.test()
x <- rnorm(20,mean=20,sd=2)
t.test(x,mu=19,alternative="greater")