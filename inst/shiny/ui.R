#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
#library(shinyexample)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Bootstrapping Demo From Normal"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Amount of Variance",
                  min = 1,
                  max = 50,
                  value = 5)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
