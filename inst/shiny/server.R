#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(glowup)

# Define server logic required to draw a histogram


shinyServer(function(input, output) {

  iter=10000
  fun="mean"
  alpha=0.05

  #Notice where the ... is repeated in the code
  n=20   #sample size

  #Now sample with replacement
  ret = reactive({

    x <- rnorm(25, mean=0, sd=input$bins)
    y=sample(x,n*iter,replace=TRUE) #A

    # Make a matrix with all the resampled values
    rs.mat = matrix(y,nr=n,nc=iter,byrow=TRUE)
    xstat = apply(rs.mat,2,fun)
    # xstat is a vector and will have iter values in it
    ci = quantile(xstat,c(alpha/2,1-alpha/2)) #B


    return(list(x=x, y=y, rsmat=rs.mat, xstat=xstat, ci=ci))
  })



  output$distPlot <- renderPlot({

    dynamic = ret()

    para=hist(dynamic$xstat,freq=FALSE,las=1,main="Histogram of Bootstrap sample statistics")

    #mat will be a matrix that contains the data, this is done so that I can use apply()
    mat=matrix(dynamic$x,nr=length(dynamic$x),nc=1,byrow=TRUE)

    #pte is the point estimate
    #This uses whatever fun is
    pte=apply(mat,2,fun)
    abline(v=pte,lwd=3,col="Black")# Vertical line
    segments(dynamic$ci[1],0, dynamic$ci[2],0,lwd=4)      #Make the segment for the ci
    text(dynamic$ci[1],0,paste("(",round(dynamic$ci[1],2),sep=""),col="Red",cex=3)
    text(dynamic$ci[2],0,paste(round(dynamic$ci[2],2),")",sep=""),col="Red",cex=3)

    # plot the point estimate 1/2 way up the density
    text(pte,max(para$density)/2,round(pte,2),cex=3)

  })




})
