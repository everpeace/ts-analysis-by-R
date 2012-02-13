x<-seq(0,5,by=0.2)
d1<-c(1,3,8,8)
d2<-c(10,10,10,30)
xx<-c(0,5)
yy<-c(0,1.5)
par(mfrow=c(2,2))
for(j in 1:4){
	y <- df(x,df1=d1[j],df2=d2[j])
	title<-paste("F(",d1[j],",",d2[j],")")
	plot(x,y,type="l",xlim=xx,ylim=yy,main=title)
}
par(mfrow=c(1,1))