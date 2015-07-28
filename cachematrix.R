##makeCacheMatrix generate a matrix which is actually a list of functions:
##      - set(): set the value for the matrix
##      - get(): return the value of the matrix
##      - setinv(): set the value of the inverse of the matrix
##      - getinv(): return the value of the inverse of the matrix

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  #xinv is initialized as a NULL variable (before it is computed)
  xinv <- NULL
  #definition of the function set(): set the value for the matrix
  set <- function(y) {
    x <<- y
    xinv <<- NULL
  }
  #definition of the function get(): return the value of the matrix
  get <- function() x
  #definition of the function setinv(): set the value of the inverse of the matrix 
  setinv <- function(cacheSolve) xinv <<- cacheSolve
  #definition of the function getinv(): get the value of the inverse of the matrix 
  getinv <- function() xinv
  #returned value of makeCacheMatrix
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        xinv <- x$getinv()
        if (!is.null(xinv)) {
          message("getting cached data")
          return(xinv)
        }
        #if the inverse is still NULL, it needs to be computed here
        #get the value of the matrix
        data <- x$get()
        #create the diagonal matrix of the same size
        b <- diag(ncol(data))
        #get the inverse matrix
        xinv <- solve(data, b, ...)
        #calling setinv() of the object x and as in setinv(), value of xinv is
        #assigned by <<- ==> xinv in a different environment can be set with the
        #new value
        x$setinv(xinv)
        xinv
}
