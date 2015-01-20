## https://github.com/emlchan/ProgrammingAssignment2

## Matrix inversion is usually a costly computation and there may be some 
## benefit to caching the inverse of a matrix rather than compute it 
## repeatedly. 

## The following two functions cache the inverse of a matrix.

## Create a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    # Creates a list to store the four functions
    # that supports the matrix.
    get <- function() x
    setInverse <- function(inv) m <<- inv
    getInverse <- function() m
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Compute the inverse of the special "matrix" returned by 
## `makeCacheMatrix`. If the inverse has already been calculated,
## and the matrix has not changed, then cacheSolve should
## retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of `x`
    m <- x$getInverse()
    
    # Cache hit. We will retrieve the result from cache.
    if (!is.null(m)) {
        return (m)
    }
    
    # Cache miss. We will need to calculate using solve.
    data <- x$get()
    m <- solve(data, ...)
    x$setInverse(m)
    
    m
}
