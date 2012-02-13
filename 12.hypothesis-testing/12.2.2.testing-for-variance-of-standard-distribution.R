# testing using Chi-squared-distributions
testing2 <- function(x,var,alpha){
	n<- length(x)
	mm <- mean(x)
	vv <- var(x)
	x0 <- (n-1)*vv/(var*var)
	xa <- qchisq(1-alpha,df=n-1)
	p <- 1-pchisq(x0,df=n-1)
	
	xx0 <- round(x0,digits=4) 
	xxa <- round(xa,digits=4)
	pp <- round(p,digits=4)
	if(p<=alpha){decision <- "rejected"}else{decision <- "not rejected"}
	title <- paste("x0:",xx0," xa:",xxa," p:",pp,decision)
	xx <- seq(0,40,by=0.05); yy <- dchisq(xx,df=n-1)
	plot(xx,yy,type="l",xlim=c(0,40),ylim=c(0,0.1),main=title)
	lines(c(x0,x0),c(0,dchisq(x0,df=n-1)),lty=1,col=2)
	lines(c(xa,xa),c(0,dchisq(xa,df=n-1)),lty=2,col=4)
	abline(h=0,col=3)
	legend(-4,0.5,legend=c("x0","xa"),lty=c(1,2),col=c(2,4))
	return(list(x0=x0,xa=xa,p=p))
}

n <- 20; m <- 2; v <- 2.5
x <- rnorm(n,mean=m,sd=sqrt(v))
testing2(x,2,0.05)

	