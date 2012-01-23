# draw gompertz curve
time <- 1:100

# CASE 1
A1 <- 100; alpha1 <- 0.005; beta1 <- 0.90
y1 <- A1*alpha1^(beta1^time)

# CASE 2
beta2 <- 0.95; y2 <- A1*alpha1^(beta2^time)

# CASE 3
alpha2 <- 0.05; y3 <- A1*alpha2^(beta1^time)

# CASE 4
A2 <- 80; y4 <- A2*alpha1^(beta1^time)

# draw
ttl <- "various gompertz curves"
sb <- "CASE1: A=100,alpha=0.005,beta=0.90"
plot(y1,type="l",xlab="",ylab="",main=ttl,sub=sb)
lines(y2,lty=2); lines(y3,lty=3); lines(y4,lty=4)
hanrei <- c("CASE1", "CASE2:beta=0.95", "CASE3:alpha=0.05", "CASE4:A=80")
legend(50,50,legend=hanrei,lty=c(1,2,3,4),box.lty=0)
