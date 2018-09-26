
Y.n = 10
Y.p = 0.1
Y = rbinom(10000, Y.n, Y.p)
X = rnorm(10000, 0, 1)

X.cmf = ecdf(X)
Y.cmf = ecdf(Y)
plot(X.cmf, col="blue")
plot(Y.cmf, col="red", add = TRUE)

#1
pnorm(0, mean=0, sd=1)
#2
pnorm(1.0, mean=0, sd=1) - pnorm(-1.0, mean=0, sd=1)
#3
1 - pnorm(1.96, mean=0, sd=1)
#4
pbinom(9, 10, 0.1) - pbinom(1, 10, 0.1) # 9 och 1 eftersom det är "mindre än" och "större än" och det är diskreta värden.
#5
pbinom(0, 10, 0.1) - pbinom(-1, 10, 0.1) # -1 för tydlighet
#6
pbinom(10, 10, 0.1) - pbinom(0, 10, 0.1) # Eftersom nu så är det "mindre eller lika med"
