## Finding the inverse of a big matrix takes time. These two functions
## work together so we only do that work once. The first time we ask
## for the inverse, we calculate it and save it. Next time, we just
## reuse the saved answer instead of calculating it again.

## This function does not calculate anything. It just builds a "box"
## that can hold a matrix and, later, its inverse.
## The box gives us four small tools:
##   set()        - put a new matrix in the box
##   get()        - take the matrix out of the box
##   setinverse() - save the inverse in the box
##   getinverse() - take the saved inverse out of the box

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## This function gives you the inverse of the matrix inside the box
## made by makeCacheMatrix().
## First it checks: did we already save the inverse before?
##   - If yes, just hand back the saved one. No new work needed.
##   - If no, calculate it now, save it in the box for next time,
##     and then hand it back.

cacheSolve <- function(x, ...) {
        ## Check the box for an inverse we already saved
        inv <- x$getinverse()
        if (!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        ## No saved inverse yet, so calculate it now
        data <- x$get()
        inv <- solve(data, ...)
        ## Save it in the box for next time
        x$setinverse(inv)
        inv
}
