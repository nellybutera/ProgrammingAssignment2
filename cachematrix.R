# makes a matrix that can remember its own inverse
makeCacheMatrix <- function(x = matrix()) {
    cached_inv <- NULL  # nothing saved yet

    set <- function(y) {
        x <<- y  # save the new matrix
        cached_inv <<- NULL  # old inverse no longer matches, so clear it
    }
    get <- function() x  # give back the matrix

    setinverse <- function(solved) cached_inv <<- solved  # save the inverse
    getinverse <- function() cached_inv  # give back the saved inverse

    list(set = set,
         get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

# gives the inverse of the matrix, using the cache if it can
cacheSolve <- function(x, ...) {
    inv <- x$getinverse()  # check if we already saved one
    if (!is.null(inv)) {
        message("getting cached data")
        return(inv)  # already saved, so just use that
    }

    mat <- x$get()  # no saved inverse, get the matrix
    inv <- solve(mat, ...)  # work out the inverse
    x$setinverse(inv)  # save it for next time

    inv
}
