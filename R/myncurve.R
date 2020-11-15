#' myncurve
#'
#' @description Determine and visualize the probability of seeing a value from -infinity to a in a normal distribution
#'
#' @param mu the mean of the normal to observe
#' @param sigma the standard deviation of the normal to observe
#'
#' @return the probability of seeing a value from -infinity to a in a in this distribution
#' @export
#'
#' @examples
#' myncurve(mu=10,sigma=5, a=6)
myncurve = function(mu, sigma, a){
  curve(dnorm(x,mean=mu,sd=sigma), xlim = c(mu-3*sigma, mu + 3*sigma))

  #curve(dchisq(x,df=3),xlim=c(0,10),ylim=c(0,0.3),lwd=2)
  xcurve=seq(a-50,a,length=5000)
  ycurve=dnorm(xcurve, mu, sigma)
  polygon(c(a-50,xcurve,a),c(0,ycurve,0),col="Blue")
  prob=pnorm(a, mu, sigma)-pnorm(a-50, mu, sigma)
  prob=round(prob,4)
  text(4,0.05, paste("Area = ", prob, sep=""))
  return(c(prob))
}
