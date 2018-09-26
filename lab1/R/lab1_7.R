X = runif(100, 0, 1)
Y = runif(100, 0, 1)

villkor <- sqrt(X^2 + Y^2) < 1

# a)
plot(X[villkor], col="red")
plot(Y[villkor], col="blue")

# b)
calcZ <- function(z, n){
  return(4 * (z / n))
}
simXY <- function(b){
  X <- runif(b, 0, 1)
  Y <- runif(b, 0, 1)
  villkor <- sqrt(X^2 + Y^2) < 1
  return(calcZ(length(X[villkor]) + length(Y[villkor]), b))
}

simXY(10000)
simXY(100000)
simXY(100000000)

# E)
X <- runif(100000, 0, 2)
Y <- runif(100000, 0, 4)
IHat = mean(Y < X^2)
IHat * 2 * 4

