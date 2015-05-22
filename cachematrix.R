## create the inverse of a matrix
## makeCacheMatrix akeCacheMatrix function creates an unique "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
## Directs to an environment outside the current environment   
  }
  get <- function() x
  setinv <- function(solve) i <<- solve
## Solves the equations that follow
  getinv <- function() i
  list(set = set, get = get, setinv = setinv, getinv = getinv) 
}

## calculates the mean of the special "vector" created with the makeCacheMatrix 
## function. However, it first checks to see if the mean has already been calculated. 
## If so, it gets the mean from the cache and skips the computation.

cacheSolve <- function(x, ...) {
  i<- x$getinv()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i<- solve(data, ...)
  x$setinv(i)
  i
  
}
