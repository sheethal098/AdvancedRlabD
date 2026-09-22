#' Calculate the greatest common divisor using the Euclidean algorithm
#' @param a A numeric scalar or integer
#' @param b A numeric scalar or integer
#' #' The algorithm repeatedly calculates the remainder of a divided by b,
#' then replaces a with b and b with the remainder.
#' This process continues until b becomes zero.
#' The value of a is then the greatest common divisor.
#' @return The greatest common divisor of a and b as a numeric value.
#' @references
#' \url{https://en.wikipedia.org/wiki/Euclidean_algorithm}
#' \url{https://www.khanacademy.org/computing/computer-science/cryptography/modarithmetic/a/the-euclidean-algorithm}
#' @export
euclidean<-function(a,b){
  if(!is.numeric(a)||length(a)!=1||a!=floor(a)){
    stop("a must be single integer")
  }
  if(!is.numeric(b)||length(b)!=1||b!=floor(b)){
    stop("b must be single integer")
  }
  while(b!=0){
    remainder<- a%%b
    a<-b
    b<-remainder
  }
  return(a)
}

