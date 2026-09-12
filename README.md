### Introduction

In this assignment you will write an R function that can "cache" a
slow calculation. For example, finding the mean of a short list of
numbers is fast. But finding the mean of a very long list can be slow,
especially if you have to do it again and again (like inside a loop).
If the list of numbers has not changed, there is no need to calculate
the mean again — we can just save (cache) the answer from last time
and reuse it. This assignment uses R's scoping rules to store, or
"remember", values like this inside an R object.

### Example: Caching the Mean of a Vector

This example uses the `<<-` operator. It lets a function save a value
into an environment other than its own, so the value is remembered
even after the function finishes running. Below are two functions that
create a special object that stores a list of numbers and remembers
its mean.

The first function, `makeVector`, creates a special "vector". It is
really a list of four small tools:

1.  set the value of the vector
2.  get the value of the vector
3.  set the value of the mean
4.  get the value of the mean

<!-- -->

    makeVector <- function(x = numeric()) {
            m <- NULL
            set <- function(y) {
                    x <<- y
                    m <<- NULL
            }
            get <- function() x
            setmean <- function(mean) m <<- mean
            getmean <- function() m
            list(set = set, get = get,
                 setmean = setmean,
                 getmean = getmean)
    }

The next function finds the mean of the special "vector" made above.
First it checks: has the mean already been saved?

- If yes, it just returns the saved mean. No new work needed.
- If no, it calculates the mean now, saves it using `setmean`, and
  then returns it.

    cachemean <- function(x, ...) {
            m <- x$getmean()
            if(!is.null(m)) {
                    message("getting cached data")
                    return(m)
            }
            data <- x$get()
            m <- mean(data, ...)
            x$setmean(m)
            m
    }

### Assignment: Caching the Inverse of a Matrix

Finding the inverse of a matrix can be slow, so it can help to save
(cache) the inverse instead of calculating it again each time (there
are other ways to avoid inverting a matrix too, but we will not cover
those here). Your job is to write two functions that cache the
inverse of a matrix.

Write the following functions:

1.  `makeCacheMatrix`: creates a special "matrix" object that can save
    its own inverse.
2.  `cacheSolve`: finds the inverse of the special "matrix" made by
    `makeCacheMatrix`. If the inverse was already saved and the
    matrix has not changed, `cacheSolve` just returns the saved
    inverse instead of calculating it again.

To find the inverse of a square matrix in R, use the `solve` function.
For example, if `X` is a square, invertible matrix, then `solve(X)`
gives you its inverse.

For this assignment, assume the matrix you are given can always be
inverted.

To finish this assignment, do the following steps:

1.  Fork the GitHub repository with the starter R files, found at
    [https://github.com/rdpeng/ProgrammingAssignment2](https://github.com/rdpeng/ProgrammingAssignment2),
    so you get your own copy under your account.
2.  Clone your forked repository to your computer so you can edit the
    files on your own machine.
3.  Edit the R file in the repository and add your solution (please
    do not rename the file).
4.  Commit your finished R file to YOUR git repository and push it to
    your GitHub account.
5.  Submit the URL of your GitHub repository to Coursera, with your
    completed R code inside.

### Grading

This assignment is graded through peer assessment.
