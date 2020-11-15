#' myclt
#'
#' @description A function to demonstrate the Central Limit Theorem on a uniform distribution.
#'
#' @param n the desired sample size
#' @param iter the number of times to take a sample of size n
#'
#' @return a vector of the sums of each sample
#' @export
#'
#' @examples
#' myclt(30, 100000)
myclt=function(n,iter){
  y=runif(n*iter,0,5) # A
  data=matrix(y,nr=n,nc=iter,byrow=TRUE) #B
  sm=apply(data,2,sum) #C
  hist(sm)
  sm
}
