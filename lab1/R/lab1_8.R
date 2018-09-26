

pullXBinom <- function(a.a){
  b = vector()
  for(a in a.a) {
    X = rbinom(a, 10, 0.2)
    X.mean = mean(X)
    b = append(b, X.mean)
  }
  return(b)
}


pullYGamma <- function(a.a){
  b = vector()
  for(a in a.a) {
    Y = rgamma(a, 2, 2)
    Y.mean = mean(Y)
    b = append(b, Y.mean)
  }
  return(b)
}




v = 1:9
totalmean = pullXBinom(v * 10)
totalpull = v * 10
totalmean = append(totalmean, pullXBinom(v * 100))
totalpull = append(totalpull, v * 100)
totalmean = append(totalmean, pullXBinom(v * 1000))
totalpull = append(totalpull, v * 1000)
totalmean = append(totalmean, pullXBinom(10000))
totalpull = append(totalpull, 10000)

plot(totalpull, totalmean, type="l", main="binomial")

totalmean2 = pullYGamma(v * 10)
totalpull2 = v * 10
totalmean2 = append(totalmean2, pullYGamma(v * 100))
totalpull2 = append(totalpull2, v * 100)
totalmean2 = append(totalmean2, pullYGamma(v * 1000))
totalpull2 = append(totalpull2, v * 1000)
totalmean2 = append(totalmean2, pullYGamma(10000))
totalpull2 = append(totalpull2, 10000)

plot(totalpull2, totalmean2, type="l", main="gamma")
