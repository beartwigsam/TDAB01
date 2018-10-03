n       = 10000
rateX   = 10
lambdaY = 3
X = rexp(n, rateX)
Y = rpois(n, lambdaY)

print(mean(X))
print(var(X))

print(mean(Y))
print(var(Y))

# 1.
print(mean(3))
# 2.
print(mean((3 * X) + 2))
# 3.
print(mean(X + Y))
# 4.
print(mean(X * Y))
# 5.
print(mean((3*X) + (2*Y) -3))
# 6.
print(var((2*X)-5))
# 7.
print(var(X + Y))