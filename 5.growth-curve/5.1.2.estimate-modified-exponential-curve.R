xdata <- read.csv("../data/Labor.csv", skip=2, header=TRUE)
r_emp <- ts(xdata$rate_employee, start=c(1953), frequency=1)

# 直線トレンドの推計
time <- seq(1:length(r_emp))
kaiki <- lm(r_emp~time)
trnd1 <- ts(kaiki$fitted, start=c(1953), frequency=1)

#推計された切片、傾きを取り出し15年分の予測値を作る
alpha <- kaiki$coef[1];beta<- kaiki$coef[2]
time2 <- seq(length(time)+1,  length(time)+15)
( yest1 <- ts((alpha+beta*time2), start=c(2007), frequency=1) )

#修正指数曲線
z <- log(100 - r_emp)
kaiki2 <- lm(z~time)
yhat <- 100-exp(kaiki2$fitted)
yhat2 <- ts(yhat, start=c(1953), frequency=1)
b <- exp(kaiki2$coef[1])
r <- -1*kaiki2$coef[2]
yest2 <- ts((100-b*exp(-1*r*time2)), start=c(2007), frequency=1)

# グラフに書く
ttl <- "女性の雇用者比率トレンド予測"
ts.plot(r_emp, trnd1, yest1, yhat2, yest2, type="l", lty=c(1, 2, 2, 3, 3), main=ttl, xlab="")
abline(h=100, col=1)
han <- c("直線トレンド", "修正指数曲線")
legend(1960, 90, legend=han, lty=c(2, 3), box.lty=0)

