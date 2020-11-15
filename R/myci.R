
#' myci
#'
#' @description find a confidence interval for a given sample's mean
#'
#' @param x vector of sample data
#' @param alpha the desired confidence level
#'
#' @return the upper and lower boundaries of the confidence interval
#' @export
#'
#' @examples
#' myci(c(1,2,3,4,5), alpha=0.005)
myci=function(x, alpha=0.05) {
  mp = c(-1,1)
  t=qt(1-alpha/2, length(x)-1)
  mean(x)+mp*t*sd(x)/sqrt(length(x))
}
