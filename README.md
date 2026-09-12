# Caching the Inverse of a Matrix

This is my solution for the R Programming "Caching the Inverse of a
Matrix" assignment.

Finding the inverse of a big matrix can be slow. So instead of doing
it again and again, we save (cache) the answer the first time. Next
time we need it, we just reuse the saved answer.

## What is in `cachematrix.R`

- `makeCacheMatrix(x)` — makes a special "box" for a matrix. It can
  hold the matrix and also save its inverse once we find it.
- `cacheSolve(x)` — gives back the inverse of that matrix.
  - If the inverse was already saved, it just returns the saved one.
  - If not, it calculates the inverse, saves it, and returns it.

## How to use it

```r
source("cachematrix.R")

m <- makeCacheMatrix(matrix(1:4, 2, 2))
cacheSolve(m)   # calculates the inverse and saves it
cacheSolve(m)   # prints "getting cached data" and returns the saved inverse
```
