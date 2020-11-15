#' @title shinyhist
#'
#'
#'
#' @description This app function uses bootstrapping to resample a sample
#' from a normal distribution with a mean of 0, and the variance is adjustable with a slider
#'

#'
#' @export
#'
#' @examples
#' \dontrun{ shinyhist()}
shinyhist<-function(){
  shiny::runApp(system.file("shiny", package="glowup"),launch.browser = TRUE)
}
