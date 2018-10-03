set.seed(4711)
x1 <- rgamma(n = 10, shape = 4, scale = 1)
x2 <- rgamma(n = 100, shape = 4, scale = 1)

gamma_beta_mle <- function(x, alpha) {
  return(length(x) * alpha * 1 / sum(x))
}

print(gamma_beta_mle(x = x1, alpha=4))
print(gamma_beta_mle(x = x2, alpha=4))