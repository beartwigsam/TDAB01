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
