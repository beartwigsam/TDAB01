v1col = rgb(0, 0, 255, max = 255, alpha = 125, names = "v1-graph")
v2col = rgb(255, 0, 0, max = 255, alpha = 125, names = "v2-graph")

v1.sd <- 4
v1.mean <- 10
v1 <- rnorm(n = 100,   v1.mean, v1.sd)
v2.sd <- 4
v2.mean <- 10
v2 <- rnorm(n = 10000, v2.mean, v2.sd)
hist(v1, probability = TRUE, xlab="Value", col=v1col, main="Histogram of v1 and v2", ylim=c(0, 0.15))
hist(v2, probability = TRUE, xlab="Value", col=v2col, add=TRUE)
legend("topleft", inset=0.02, c("V1", "V2"), fill=c(v1col, v2col), horiz=TRUE, cex=0.8)

v1.pdf <- (1 / sqrt(2 * pi * v1.sd^2)) * exp(-(v1 - v1.mean)^2 / (2 * v1.sd^2))
v2.pdf <- (1 / sqrt(2 * pi * v2.sd^2)) * exp(-(v2 - v2.mean)^2 / (2 * v2.sd^2))
hist(v1.pdf, probability = TRUE, xlab="Probability", 
     col=v1col, main="pdf histogram of v1 and v2", ylim=c(0, 50))
hist(v2.pdf, probability = TRUE, col=v2col, add=TRUE)

legend("topleft", inset=0.02, c("V1", "V2"), fill=c(v1col, v2col), horiz=TRUE, cex=0.8)