# a simple sample of least square method.
Cons <- c(17.4, 18.4, 20.6, 23.6, 26.5, 27.5, 30.3, 35.3, 39.8, 49.0)
Yd <- c(14.3, 23.5, 27.4, 31.7, 35.3, 38.9, 43.6, 49.3, 57.6, 75.5)

# draw the data.
plot(Yd, Cons)

# trend extraction (linear regression) by least square method.
(kaiki1 <- lm(Cons~Yd))

# display residuals
kaiki1$residuals

# draw an extracted trend.
abline(kaiki1, col=2)

