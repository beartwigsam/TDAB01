n       = 1000
lambda  = 5
rate    = 1
size    = 10
p       = 0.01

X = rpois(n, lambda)
Y = rexp(n, rate)
Z = rbinom(n, size, p)

hist(X, col="blue", ylim = c(0, 1000))
hist(Y, col="red", add=TRUE)
hist(Z, col="green", add=TRUE)

# Makes a given number of pulls from Z, where every pull is
#  a mean value of 10 samples from Z.
# These pulls are then returned as a vector.
meanOf10 <- function(pulls, Z) {
  v = vector(length=1000)
  m = 0
  
  for(i in 1:1000) {
    m = 0
    for(j in 1:pulls) {
      m = m + sample(Z, 1)
    }
    m = m/pulls
    v[i] = m
  }
  return(v)
}

Xhat = meanOf10(10, X)
Yhat = meanOf10(10, Y)

hist(Xhat, xlim = c(0, 8), ylim = c(0, 250), col="blue", main = paste("X (blue) and Y (red)"))
hist(Yhat, add=TRUE, col="red")

X1 = meanOf10(30, X)
X2 = meanOf10(100, X)
X3 = meanOf10(1000, X)
hist(X1, col="blue", ylim = c(0, 250), breaks = 50, main = paste("30 (blue), 100 (cyan) and 1000 (green) pulls from X"))
hist(X2, col="cyan",add = TRUE, breaks = 50)
hist(X3, col="green",add = TRUE, breaks = 10) 

Y1 = meanOf10(30, Y)
Y2 = meanOf10(100, Y)
Y3 = meanOf10(1000, Y)
hist(Y1, col="blue", ylim = c(0, 250), breaks = 50, main = paste("30 (blue), 100 (cyan) and 1000 (green) pulls from Y"))
hist(Y2, col="cyan",add = TRUE, breaks = 50)
hist(Y3, col="green",add = TRUE, breaks = 10)

Z1 = meanOf10(30, Z)
Z2 = meanOf10(100, Z)
Z3 = meanOf10(1000, Z)
hist(Z1, col="blue", ylim = c(0, 250), main = paste("30 (blue), 100 (cyan) and 1000 (green) pulls from Z"))
hist(Z2, col="cyan",add = TRUE)
hist(Z3, col="green",add = TRUE)