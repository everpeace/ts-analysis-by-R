coin3 <- function(theta1, theta2, n){
  x <-runif(n)*360
  sum((x>theta1)&(x<theta2))/n
}

(coin3(90, 180, 10))
(coin3(90, 180, 100))
(coin3(90, 180, 1000))
(coin3(90, 180, 10000))
(coin3(90, 180, 100000))

