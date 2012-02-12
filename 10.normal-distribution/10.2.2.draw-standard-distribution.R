mu0 <- 0; sigma0 <- 1
mu1 <- 2; sigma1 <- 2
x1 <- min(mu0-4*sigma0, mu1-4*sigma1)
x2 <- max(mu0+4*sigma0, mu1+4*sigma1)
yy <- max(1/(sqrt(2*pi)*sigma0), 1/(sqrt(2*pi)*sigma1))*1.05

x <- seq(x1, x2, length.out=400)
y0 <- dnorm(x, mean=mu0, sd=sigma0)
y1 <- dnorm(x, mean=mu1, sd=sigma1)
y2 <- dnorm(x, mean=mu0, sd=sigma1)

ttl <- "various normal distributions"
plot(x, y0, type="l", xlim=c(x1, x2), ylim=c(0, yy), main=ttl)
lines(x, y1, type="l", lty=2)
lines(x, y2, type="l", lty=3)
lines(c(mu0, mu0), c(0, dnorm(mu0, mean=mu0, sd=sigma0)), lty=1)
lines(c(mu1, mu1), c(0, dnorm(mu1, mean=mu1, sd=sigma1)), lty=1)
abline(h=0, lty=1);
z1 <- paste("ave: ", mu0, " var: ", sigma0)
z2 <- paste("ave: ", mu1, " var: ", sigma1)
z3 <- paste("ave: ", mu0, " var: ", sigma1)
han <- c(z1, z2, z3)
legend(-8, 0, 4, legend=han, lty=c(1, 2, 3), box.lty=0)

