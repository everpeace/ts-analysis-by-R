# ロジスティク曲線を描く
time <- 1:100
# CASE 1
A1 <- 100; k1 <- 0.2; alpha1 <- 100
y1 <- A1/(1+alpha1*exp(-1*k1*time))
# CASE 2
k2 <- 0.1
y2 <- A1/(1+alpha1*exp(-1*k2*time))
# CASE 3
alpha1 <- 300
y3 <- A1/(1+alpha1*exp(-1*k1*time))
# CASE 4
A2 <- 80
y4 <- A2/(1+alpha1*exp(-1*k1*time))
# draw graphs
ttl <- "various logistic curves"
sb <- "CASE1: A=100, k=0.2, alpha=100"
plot(y1, type="l", xlab="", ylab="", main=ttl, sub=sb)
lines(y2, type="l", lty=2)
lines(y3, type="l", lty=3)
lines(y4, type="l", lty=4)
hanrei <- c("CASE1", "CASE2:k=0.1", "CASE3:alpha=300", "CASE4:A=80")
legend(50, 50, legend=hanrei, lty=c(1, 2, 3, 4), box.lty=0)


