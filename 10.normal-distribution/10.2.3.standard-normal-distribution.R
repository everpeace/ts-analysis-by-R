zu1 <- function(x1, x2, mu, sig2){
  sig<-sqrt(sig2);xmin<-mu-4*sig;xmax<-mu+4*sig
  dx<-(xmax-xmin)/200; x<-seq(xmin, xmax, by=dx)
  y<-dnorm(x, mean=mu, sd=sig)
  xl<- c(xmin, xmax); yl<-c(0, max(y)*1.05)
  k1 <- round((x1-mu)/sig, digits=2)
  k2 <- round((x2-mu)/sig, digits=2)
  sigma <- round(sig, digits=2)
  ttl <- paste(mu, "+", k2, "*", sigma, "<= x <=", mu, "+", k2, "*", sigma)
  plot(x, y, type="l", xlim=xl, ylim=yl, xlab="x", ylab="y", main=ttl)
  pp <- pnorm(x2, mean=mu, sd=sig)-pnorm(x1, mean=mu, sd=sig)
  px <- round(pp, digits=4)
  y1<-0;y2<-0;x3<-x2;x4<-x1;
  y3<-dnorm(x3, mean=mu, sd=sig)
  y4<-dnorm(x4, mean=mu, sd=sig)
  xx<-rev(seq(x4, x3, by=(x3-x4)/200))
  yy<-dnorm(xx, mean=mu, sd=sig)
  xx<-c(x1, x2, x3, xx, x4);yy<-c(y1, y2, y3, yy, y4)
  polygon(xx, yy, col=gray(0.5))
  x0<-(x1+x2)/2;y0<-max(yy)/2;text(x0, y0, px)
}

par(mfrow=c(3, 1))
x1<-8;x2<-12;mu<-10;sig2<-4
zu1(x1, x2, mu, sig2)
x1<-6;x2<-14;mu<-10;sig2<-4
zu1(x1, x2, mu, sig2)
x1<-4;x2<-16;mu<-10;sig2<-4
zu1(x1, x2, mu, sig2)

