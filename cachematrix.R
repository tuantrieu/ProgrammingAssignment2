## caculating invert matrix by caching


## create a matrix object that holds the matrix and its invert matrix

makeCacheMatrix <- function(x = matrix()) {
      invert_x <<- NULL
      
      set <- function(y){
            x <<- y
            invert_x <<- NULL
      }
      
      get <- function(){
            x
      }
      
      set_invert_matrix <- function(mt){
            invert_x <<- mt            
      } 
      
      get_invert_matrix <- function(){
            invert_x
      }
      
      list(set = set, get = get, set_invert_matrix = set_invert_matrix, get_invert_matrix = get_invert_matrix)      
      

}


## return invert matrix of a matrix, either by calculating or retrieving from memory if calculated before

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      invert_x <- x$get_invert_matrix()
      ## if invert_x is calculated before or not
      if(!is.null(invert_x)) {
            message("getting cached data")
            return(invert_x)
      }
      
      ## if the invert matrix is not calculated 
      data <- x$get()
      ## calculate it 
      invert_x <- solve(data)
      
      ## store it to retrieve it later
      x$set_invert_matrix(invert_x)
      invert_x     
      
}
