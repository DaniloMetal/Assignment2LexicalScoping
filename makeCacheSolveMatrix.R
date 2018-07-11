makeCacheMatrix <- function(MatInput = matrix()) {
        InverseMatrix <- NULL
        set <- function(y) {
                MatInput <<- y
                InverseMatrix <<- NULL
        }
        get <- function() MatInput
        setInverse <- function(solve) InverseMatrix <<- solve
        getInverse <- function() InverseMatrix
        list(set = set,
             get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


cacheSolve <- function(MatInput, ...) {
        InverseMatrix <- MatInput$getInverse()
        if (!is.null(InverseMatrix)) {
                message("getting cached data")
                return(InverseMatrix)
        }
        mat <- MatInput$get()
        InverseMatrix <- solve(mat, ...)
        MatInput$setInverse(InverseMatrix)
        InverseMatrix
}Function makeCacheMatrix and cacheSolve
