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


hist(dgamma(x1, shape = alpha.values[which.max(v3)], scale = beta.values[which.max(v1)]), xlab = "f(x)", main = "gamma x1",)
hist(dgamma(x2, shape = alpha.values[which.max(v4)], scale = beta.values[which.max(v2)]), xlab = "f(x)", main = "gamma x2")
hist(dnorm(x1, mean = mu.values[which.max(v5)], sd = 1), xlab = "f(x)", main = "normal x1")
hist(dnorm(x2, mean = mu.values[which.max(v6)], sd = 1), xlab = "f(x)", main = "normal x2")
hist(x1)
hist(x2)