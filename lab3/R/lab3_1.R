# a)

v        = 1
interval = seq(-5, 15, 1)
prior    = dt(interval, v)
plot(interval, seq(0, 0.4, 0.02), type="n", main = "prior")
lines(interval, prior, col = "blue")

# b)

observed = c(11.371, 9.4353, 10.3631, 10.6329, 10.4043, 9.8939, 11.5115)
plot(observed, xlim = c(-5, 15), main = "Observed data")
hist(observed, xlim = c(-5, 15))

# c)
# Our function
normal_log_likelihood <- function(mu, data) {
  sd = 1
  n  = length(data)
  return( 
    -((n/2)*log(2*pi)) - ((n/2)*log(sd^2)) -(1/(2 * sd^2))*sum((data - mu)^2) 
    )
}

# We apply our function on our prior.
likelihood = vector(length = length(prior))
for (i in 1:length(prior)) {
  likelihood[i] = normal_log_likelihood(interval[i], observed)
  print(prior[i])
  print(likelihood[i])
}

# We plot our likelihood
plot(interval, seq(-850, 0, 42.5), type="n", main = "likelihood")
lines(interval, likelihood, col = "red")
