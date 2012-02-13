prediction <- function(mdl,xh,p){
	x<-mdl$model[,2]; y<-mdl$model[,1]; e<-mdl$resid; n<-length(x)
	a<- mdl$coef[1]; b<-mdl$coef[2]
	yh <- a+b*xh
	sgm <- sqrt(sum(e*e)/(n-2)); sx <- var(x)*(n-1)
	ms <- sqrt( 1+(1/n)+(xh-mean(x))^2/sx)*sgm
	k <- (1-p)/2; tk<-qt(1-k,df=n-2)
	yL <- yh-tk*ms; yU <- yh+tk*ms
	xmin<- min(xh,x); xmax<-max(xh,x)
	ymin<-min(yL,y);ymax<-max(yU,y)
	title<-paste("simple linear regression with confidence interval of ",p)
	plot(x,y,xlim=c(xmin,xmax),ylim=c(ymin,ymax),main=title)
	lines(xh,yh,lty=1); lines(xh,yL,lty=2);lines(xh,yU,lty=2)
	return(list(xh=xh,yL=yL,yh=yh,yU=yU))
}

y <- c(34.2,33.6,33.1,32.7,33.2,32.9,32.0)
x <- c(47.4,46.6,45.4,44.1,44.6,44.1,44.1)
model <- lm(y~x)
summary <- summary(reg1)

xh <- seq(40,50,by=0.5)
prediction(model,xh,0.9)