# testing using t-distributions
testing1 <- function(x,mu,alpha){
	n<- length(x)
	mm <- mean(x)
	s <- sd(x)
	t0 <- (mm-mu)/(s/sqrt(n))
	ta <- qt(1-alpha,df=n-1)
	p <- 1-pt(t0,df=n-1)
	
	tt0 <- round(t0,digits=4) 
	tta <- round(ta,digits=4)
	pp <- round(p,digits=4)
	if(p<alpha){decision <- "rejected"}else{decision <- "not rejected"}
	title <- paste("t0:",tt0," ta:",tta," p:",pp,decision)
	xx <- seq(-4,4,by=0.05); yy <- dt(xx,df=n-1)
	plot(xx,yy,type="l",xlim=c(-4,4),ylim=c(0,0.5),main=title)
	lines(c(t0,t0),c(0,dt(t0,df=n-1)),lty=1,col=2)
	lines(c(ta,ta),c(0,dt(ta,df=n-1)),lty=2,col=4)
	abline(h=0,col=3)
	legend(-4,0.5,legend=c("t0","ta"),lty=c(1,2),col=c(2,4))
	return(list(t0=t0,ta=ta,p=p))
}

n <- 20; m <- 2.5; v <- 2
x <- rnorm(n,mean=m,sd=sqrt(v))
testing1(x,2,0.05)

	