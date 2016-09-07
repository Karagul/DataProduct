
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Stock Price Analysis"),

  # Sidebar with a stock quote and forcast options
  sidebarLayout(
  
    sidebarPanel(
      textInput("caption", "Enter the stock symbol", ""),
      selectInput("dataset", "Select a choice", 
                  choices = c("Stock Quote", "Stock Analysis Summary", "Stock Kalman Filter Prediction", 
                              "Stock Forecast", "Stock Moving Average Convergence Divergence",
                              "Stock Simple Moving Averages",
					"Stock On Balance Volume", "Stock Accumulation Distribution Line",
					"Stock Average Directional Index", "Stock Aroon Indicator",
					"Stock Relative Strength Index", "Stock Stochastic Oscillator"
                              )),
      sliderInput("numDays", "Please Use Slider to Generate the Number of Days for the Plot", 
                  value = 65, min = 36, max = 2600, step = 1),
      submitButton("Submit")       
    ),

    # Show a plot of the generated distribution
    mainPanel(
      verbatimTextOutput("caption"),
      tableOutput("view"),
      plotOutput("plot")
    )
  )
))
