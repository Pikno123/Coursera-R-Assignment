## First, I use the set function to accept an input matrix y, 
assign it to x, and set the inverse matrix I need, inverse1, 
to null. Then, I use the setinverse function to accept a matrix 
inverse2 and assign it to inverse1, which is the inverse matrix. 
Finally, the function returns a list containing these four functions.



makeCacheMatrix <- function(x = matrix()) {
inverse1 <- NULL
  set <- function(y) {
    x <<- y
    inverse1 <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse2) inverse1 <<- inverse2
  getinverse <- function() inverse1
  list(set = set, get = get,setinverse = setinverse,getinverse = getinverse)
}


## Firstly, I use x $getinverse() to obtain whether there is already
 a stored inverse matrix inverse1. If so, I output "existed inverse" 
and returnan inverse matrix. If not, I use x $get() to obtain the 
input matrix and calculate the inverse matrix. Then, I store this value
 and return the inverse matrix inverse1.

cacheSolve <- function(x, ...) {

inverse1 <- x$getinverse()
  if(!is.null(inverse1)) {
    message("existed inverse")
    return(inverse1)
  }
  data <- x$get()
  inverse1 <- solve(data, ...)
  x$setinverse(inverse1)
  inverse1
}
