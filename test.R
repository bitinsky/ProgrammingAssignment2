set.seed(1)
mat <- matrix(rnorm(9), nrow = 3, ncol = 3)

m <- makeCacheMatrix(mat)
inv1 <- cacheSolve(m)

library(matlib)
inv2 <- inv(mat)

identical(round(inv1, 3), round(inv2, 3))

system.time(cacheSolve(m))
system.time(inv(mat))