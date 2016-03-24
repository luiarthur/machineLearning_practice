library(randomForest)

p <- 3
n <- 1000
x <- matrix(rnorm(n*p,0,10),n,p)

y <- x[,1]^2 + sin(x[,2]) - 3*x[,3] + rnorm(n,0,.1)

ranf <- randomForest(x,y)

plot(y,ranf$pred)

mean((ranf$pred - y)^2)

plot(sort(y))
lines(ranf$pred[order(y)],col="blue")
