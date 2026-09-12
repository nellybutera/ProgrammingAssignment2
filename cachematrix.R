makeCacheMatrix <- function(x = matrix()) {
    cached_inv <- NULL

    set <- function(y) {
        x <<- y
        cached_inv <<- NULL
    }
    get <- function() x

    setinverse <- function(solved) cached_inv <<- solved
    getinverse <- function() cached_inv

    list(set = set,
         get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

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
