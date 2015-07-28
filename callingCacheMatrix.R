source("cachematrix.R")
#use makeCacheMatrix() to set the special matrix
mymat <- makeCacheMatrix(g)
#read the matrix value
mymat$get()
#read the inverse and should get NULL at the inverse has not yet been calculated
mymat$getinv()
####caclculate the inverse by calling setinv()
mymat$setinv(cacheSolve(mymat))
####checking the result of the inverse calculation
mymat$getinv()
mymat$get()
r11<-mymat$get()
r12<-mymat$getinv()
r12%*%r11

####calculate the inverse by calling cacheSolve directly
mat2 <- makeCacheMatrix(matrix(c(0,1,2,4,5,6,9,7,8),3,3))
mat2$get()
cacheSolve(mat2)
mat2$getinv()
####cacheSolve doesn't calculate the inverse but taking it out from the cache
cacheSolve(mat2)
