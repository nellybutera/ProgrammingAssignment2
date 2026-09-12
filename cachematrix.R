# Programming Assignment 2 - caching a matrix inverse
#
# solve() on a big matrix isn't cheap, and there's no point running it
# twice on the same matrix. So the plan here is simple: the first time
# we invert a matrix, we hang on to the answer. If nothing about the
# matrix has changed, the next call just reuses that answer instead of
# doing the math again.

# makeCacheMatrix wraps a matrix in a little object that knows how to
# hold on to its own inverse once someone bothers to calculate it.
# It hands back 4 functions:
#   set(y)       swap in a new matrix (this wipes any cached inverse)
#   get()        return the current matrix
#   setinverse() store an inverse we just calculated
#   getinverse() return whatever inverse is currently stored (or NULL)
makeCacheMatrix <- function(x = matrix()) {
    cached_inv <- NULL

    set <- function(y) {
        x <<- y
        cached_inv <<- NULL  # new matrix means the old inverse doesn't apply anymore
    }
    get <- function() x

    setinverse <- function(solved) cached_inv <<- solved
    getinverse <- function() cached_inv

    list(set = set,
         get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

# cacheSolve returns the inverse of whatever makeCacheMatrix object you
# hand it. Nothing fancy - check if it's already been solved, and if
# not, solve it and remember the answer for next time.
cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    if (!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }

    mat <- x$get()
    inv <- solve(mat, ...)
    x$setinverse(inv)

    inv
}
