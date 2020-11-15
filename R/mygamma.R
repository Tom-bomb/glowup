#' mygamma
#'
#' @description Determine and visualize exponential densities using the gamma distribution
#'
#' @param shape shape parameter for the gamma PDF that will be produced
#' @param rate rate parameter for the gamma PDF that will be produced
#' @param a the value at which you wish to know the -infinity to a probability of of this distribution
#'
#' @return a vector of the probability
#' @export
#'
#' @examples
#' mygamma(3, 1, 2)
#' x<-mygamma(1, 1, 3)
mygamma = function(shape, rate=1, a){
  curve(dgamma(x, shape, rate), xlim = c(a-3*a, a + 3*a))

  #curve(dchisq(x,df=3),xlim=c(0,10),ylim=c(0,0.3),lwd=2)
  xcurve=seq(a-50,a,length=5000)
  ycurve=dgamma(xcurve, shape, rate)
  polygon(c(a-50,xcurve,a),c(0,ycurve,0),col="Blue")
  prob=pgamma(a, shape, rate)-pgamma(a-50, shape, rate)
  prob=round(prob,4)
  text(4,0.05, paste("Area = ", prob, sep=""))
  return(c(prob))
}
