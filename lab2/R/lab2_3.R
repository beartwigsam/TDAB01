


norm_mu_mle <- function(x) {
  return(mean(x))
}

norm_sigma2_mle <- function(x) {
  return((1/length(x)) * sum((x - mean(x))^2))
}

test_x <- 1:10
norm_mu_mle(x = test_x)
norm_sigma2_mle(x = test_x)



set.seed(42)
y1 = rnorm(10, mean = 10, sd = 2)
y2 = rnorm(10000, mean = 10, sd = 2)

norm_mu_mle(y1)
norm_mu_mle(y2)
norm_sigma2_mle(y1)
norm_sigma2_mle(y2)

## 4
beta1_mle = vector(length = 2000)
beta2_mle = vector(length = 2000)
mu1 = vector(length = 2000)
mu2 = vector(length = 2000)
sigma1 = vector(length = 2000)
sigma2 = vector(length = 2000)
v = 1:2000
for(i in v) {
  x1 <- rgamma(10, shape = 4, scale = 1)
  x2 <- rgamma(10000, shape = 4, scale = 1)
  beta1_mle[i] = gamma_beta_mle(x = x1, alpha = 4)
  beta2_mle[i] = gamma_beta_mle(x = x2, alpha = 4)
  
  y1 <- rnorm(10, mean = 10, sd = 2)
  y2 <- rnorm(10000, mean = 10, sd = 2)
  mu1[i] = norm_mu_mle(x = y1)
  mu2[i] = norm_mu_mle(x = y2)
  sigma1[i] = norm_sigma2_mle(x = y1)
  sigma2[i] = norm_sigma2_mle(x = y2)
}

hist(beta1_mle, col="red")
hist(mu1, col="red")
hist(sigma1, col="red")

hist(beta2_mle, col="blue")
hist(mu2, col="blue")
hist(sigma2, col="blue")