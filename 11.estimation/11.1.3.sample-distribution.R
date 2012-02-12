x <- seq(0, 10, by=0.02)
y1 <- dchisq(x, df=1);
y2 <- dchisq(x, df=2);
y3 <- dchisq(x, df=3);
y5 <- dchisq(x, df=5);
y8 <- dchisq(x, df=8);

ttl="various chi squared distributions"
plot(x, y1, type="l", xlim=c(0, 10), ylim=c(0, 1), main=ttl)
lines(x, y2, lty=2)
lines(x, y3, lty=3)
lines(x, y5, lty=4)
lines(x, y8, lty=5)
han <- c("free=1", "free=2", "free=3", "free=5", "free=8")
legend(4, 1, legend=han, lty=1:5, box.lty=0)
