set.seed(4711)
x1 <- rgamma(n = 10, shape = 4, scale = 1)
x2 <- rgamma(n = 100, shape = 4, scale = 1)

llgamma <- function(x, alpha, beta)  {
  return(length(x) * (alpha * log(beta) - lgamma(alpha)) +
    (alpha - 1) * sum(log(x)) - beta * sum(x))
}

# a)
llgamma(x1, 2, 2)

# b)
beta.values = seq(0.01, 10, by=0.01)

v1 = vector()
v2 = vector()
for(beta.v in beta.values) {
  v1 = append(v1, llgamma(x1, 4, beta.v))
  v2 = append(v2, llgamma(x2, 4, beta.v))
}

beta.values[which.max(v1)]
beta.values[which.max(v2)]
plot(v1, xlab = "Beta index")
plot(v2, xlab = "Beta index")

# c)
alpha.values = seq(0.01, 10, by=0.01)

v3 = vector()
v4 = vector()
for(alpha.v in alpha.values) {
  v3 = append(v3, llgamma(x1, alpha.v, 1))
  v4 = append(v4, llgamma(x2, alpha.v, 1))
}
alpha.values[which.max(v3)]
alpha.values[which.max(v4)]
plot(v3, xlab = "Alpha index")
plot(v4, xlab = "Alpha index")

# d)
llnormal <- function(x, mu, sigma2) {
  - (length(x) / 2) * log(2 * pi) - (length(x) / 2) * log(sigma2) -
    (1 / (2 * sigma2)) * sum((x - mu)^2)
}

llnormal(x = x1, mu = 2, sigma2 = 1)

# e)
mu.values = seq(0, 10, by=0.01)

v5 = vector()
v6 = vector()
for(mu.v in mu.values) {
  v5 = append(v5, llnormal(x1, mu.v, 1))
  v6 = append(v6, llnormal(x2, mu.v, 1))
}
mu.values[which.max(v5)]
mu.values[which.max(v6)]
plot(v5, xlab = "Mu index")
plot(v6, xlab = "Mu index")



hist(x1, probability = TRUE, main = "gamma x1", ylim=c(0,0.5))
xfit <- seq(min(x1), max(x1), length.out = length(x1))
yfit <- dgamma(xfit, shape = alpha.values[which.max(v3)], scale = beta.values[which.max(v1)])
lines(xfit, yfit, col="blue", lwd=2)

hist(x2, probability = TRUE, main = "gamma x2", ylim=c(0,0.5))
xfit <- seq(min(x2), max(x2), length.out = length(x2))
yfit <- dgamma(xfit, shape = alpha.values[which.max(v4)], scale = beta.values[which.max(v2)])
lines(xfit, yfit, col="blue", lwd=2)

hist(x1, probability = TRUE, main = "normal x1", ylim=c(0,0.5))
xfit <- seq(min(x1), max(x1), length.out = length(x1))
yfit <- dnorm(xfit, mean = mu.values[which.max(v5)], sd = 1)
lines(xfit, yfit, col="blue", lwd=2)

hist(x2, probability = TRUE, main = "normal x2", ylim=c(0,0.5))
xfit <- seq(min(x2), max(x2), length.out = length(x2))
yfit <- dnorm(xfit, mean = mu.values[which.max(v6)], sd = 1)
lines(xfit, yfit, col="blue", lwd=2)

hist(x1, probability = TRUE, ylim=c(0,0.5))
xfit <- seq(min(x1), max(x1), length.out = length(x1))
yfit <- dgamma(xfit, shape = 4, scale = 1)
lines(xfit, yfit, col="blue", lwd=2)

hist(x2, probability = TRUE, ylim=c(0,0.5))
xfit <- seq(min(x2), max(x2), length.out = length(x2))
yfit <- dgamma(xfit, shape = 4, scale = 1)
lines(xfit, yfit, col="blue", lwd=2)