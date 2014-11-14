## Matrix inversion is a computation that may take a long time.
## If the matrix is static then it doesn't make sense to repeatedly
## evaluate it.  Utilizing lexical scoping it may be possible to 
## cache the evaluation and store if for the next time.

## This first function creates a vector of four functions:
##    set the matrix
##    get the matrix
##    set the inverse
##    get the inverse


makeCacheMatrix <- function(x = matrix()) {

    inverse_matrix <- NULL
    set <- function(y) {
      x <<- y
      inverse_matrix <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inverse_matrix <<- inverse
    getinverse <- function() inverse_matrix
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
  
  
}


## This function first checks if the inverse has already
## been evaluated. If so then it retrieves the answer 
## from cached data in the containing environment.
## If the answer has not yet been solved, then the routine 
## will evaulate and cache the answer. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

    inverse_matrix <- x$getinverse()
    if(!is.null(inverse_matrix)) {
      message("getting cached data")
      return(inverse_matrix)
    }
    data <- x$get()
    inverse_matrix <- solve(data, ...)
    x$setinverse(inverse_matrix)
    inverse_matrix
  
}
