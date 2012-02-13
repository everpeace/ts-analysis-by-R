y <- c(34.2,33.6,33.1,32.7,33.2,32.9,32.0)
x <- c(47.4,46.6,45.4,44.1,44.6,44.1,44.1)

reg1 <- lm(y~x)
result <- summary(reg1)

(result)

plot(x,y,xlim=c(40,50),ylim=c(30,40))
abline(reg1,col=2)
