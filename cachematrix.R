## This is a script that creates an inverse matrix and stores it in 
## cache. 
##

## The function creates an empty matrix so that you can pass in different matrices 
## by calling the functions within the function. This prints a list of functions 
## that you can use to establish an inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(solve) inv <<- solve
        getinv <- function() inv
        list(set = set, get = get, 
             setinv = setinv,
             getinv = getinv)

}

## This function finds the inverse of a matrix or will use the cashed matrix 
## if it has has been previously calculated.

cacheSolve <- function(x, ...) {
        inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        mat <- x$get()
        inv <- solve(mat, ...)
        x$setinv(inv)
        return(inv)
}
   
        ## Return a matrix that is the inverse of 'x'

