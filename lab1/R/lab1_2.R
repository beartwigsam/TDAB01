x1 = rbinom(n = 10000, size = 1, prob = 0.2)
hist(x1)

x2 = rbinom(10000, 20, 0.1)
hist(x2)

x3 = rbinom(10000, 20, 0.5)
hist(x3)

x4 = rgeom(10000, 0.1)
hist(x4)

x5 = rpois(10000, 10)
hist(x5)

y1 = runif(10000, 0, 1)
hist(y1, breaks = 100)

y2 = rexp(10000, 3)
hist(y2, breaks = 100)

y3 = rgamma(10000, 2, 1)
hist(y3, breaks = 100)

y4 = rt(10000, 3, 0)
hist(y4, breaks = 100)

y5 = rbeta(10000, 0.1, 0.1)
hist(y5, breaks = 100)

y6 = rbeta(10000, 1, 1)
hist(y6, breaks = 100)

y7 = rbeta(10000, 10, 5)
hist(y7, breaks = 100)

