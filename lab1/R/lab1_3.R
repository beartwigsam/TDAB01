
stats = data(faithful)
waiting = faithful[, 2]
hist(waiting, breaks = 50, probability = TRUE, xlim=c(40, 100), ylim=c(0, 0.12))

k <- 1:10000
x1 = rbinom(10000, 1, 0.35)
norm1 = rnorm(10000, 54, sqrt(20))
norm2 = rnorm(10000, 79, sqrt(25))
i = 1
for(x in x1) 
{
  k[i] = sample(x * norm1 + (1 - x) * norm2, 1)
  i = i + 1
}
hist(k, breaks=50, probability = TRUE, xlim=c(40, 100), ylim=c(0, 0.12))
