par(mfrow=c(1,2))
x <- seq(-0.5,4,by=0.02); y <- dnorm(x)
xl <- c(-0.5,4); yl <- c(0,max(y)*1.05)
alpha <- 0.05; xa <- qnorm(1-alpha)
x1 <- seq(xa,4,by=0.02); m <- length(x1)
x2 <- rev(x1); xx <- c(x1,x2); yy <- c(rep(0,m),dnorm(x2))

ttl <- "significance-level and critical region"
plot(x,y,type="l",xlim=xl,ylim=yl,main=ttl,xlab="",ylab="")
polygon(xx,yy,col=3); segments(2,0.03,2.5,0.2)
text(2.5,0.2, "sig. level for 0.05",adj=c(NA,0))
text(xa,0,"xa",adj=c(1,0))
arrows(xa,0.01,4,0.01); text(3,0.03,"critical region")

x3 <- seq(2.3,4,by=0.02); m3 <- length(x3)
x4 <- rev(x3); xxx <- c(x3,x4); yyy <- c(rep(0,m3),dnorm(x4))
ttl <- "significance-level and p-value"
plot(x,y,type="l",xlim=xl,ylim=yl,main=ttl,xlab="",ylab="")
polygon(xx,yy,col=3); segments(2,0.03,2.5,0.2)
text(2.5,0.2,"sig. level for 0.05",adj=c(NA,0))
text(xa,0,"xa",adj=c(1,0))
polygon(xxx,yyy,col=6); segments(2.5,0.01,3,0.05)
text(3,0.05," p ",adj=c(0,0),cex=1.5)
text(2.3,0,"x0",adj=c(1,0))
par(mfrow=c(1,1))


