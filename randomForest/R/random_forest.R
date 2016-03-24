library(randomForest)

p <- 3
n <- 1000
x <- matrix(rnorm(n*p,0,1),n,p)

mu <- x[,1]^2 + sin(x[,2]) - 3*x[,3]
y <- mu + rnorm(n,0,.1)

library(tree)
one.tree <- tree(y~x)
plot(one.tree,col="grey"); text(one.tree)

ranf <- randomForest(x,y)
plot(y,ranf$pred)
mean((ranf$pred - y)^2)

plot(sort(mu),type="l")
points(ranf$pred[order(mu)],col="blue",cex=.5)
points(y[order(mu)]-ranf$pred[order(mu)],col="red",cex=.5)

plot(y-ranf$pred,col="red",cex=.5)
