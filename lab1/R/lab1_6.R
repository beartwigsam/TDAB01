

GS = rbinom(10000, 337, 0.1)
NS.P = runif(10000, 0.02, 0.16)
NS = rbinom(10000, 337, sample(NS.P))

# a)
GS.exp.errors = 0.1 * 337
NS.exp.errors = mean(NS.P) * 337
print(GS.exp.errors)
print(NS.exp.errors)

# b)
NS.cmf = ecdf(NS)
NS.cmf(GS.exp.errors)
plot(NS.cmf, col="blue")

GS.cmf = ecdf(GS)
GS.cmf(GS.exp.errors)
plot(GS.cmf, col="red", add=TRUE)
abline(v=GS.exp.errors, col="grey", lwd=1, lty=2)

# c)
NS.p.50 = 1 - NS.cmf(50)
GS.p.50 = 1 - GS.cmf(50)
print(NS.p.50)
print(GS.p.50)
abline(v=50, col="grey", lwd=1, lty=2)