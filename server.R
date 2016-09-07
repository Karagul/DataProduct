library(shiny)
shinyServer(function(input, output) {  
  datasetInput <- reactive({
     switch(input$dataset,
        "Stock Quote" = {
              source("priceQuote.R");
              priceQuote(input$caption) ##stockSym)
          },
          "Stock Forecast" = {
              source("stockData.R");
              stockData(input$caption, "1999/1/1", Sys.Date()) 
          },
        "Stock Simple Moving Averages" = {
          source("stockData.R");
          stockData(input$caption, "1999/1/1", Sys.Date()) 
        },
  	  "Stock On Balance Volume" = {
          source("stockData.R");
          stockData(input$caption, "1999/1/1", Sys.Date()) 
        }, 
	  "Stock Accumulation Distribution Line" = {
          source("stockData.R");
          stockData(input$caption, "1999/1/1", Sys.Date()) 
        },
	  "Stock Average Directional Index" = {
          source("stockData.R");
          stockData(input$caption, "1999/1/1", Sys.Date()) 
        }, 
	  "Stock Aroon Indicator" = {
          source("stockData.R");
          stockData(input$caption, "1999/1/1", Sys.Date()) 
        },
	  "Stock Moving Average Convergence Divergence" = {
          source("stockData.R");
          stockData(input$caption, "1999/1/1", Sys.Date()) 
        },
	  "Stock Relative Strength Index" = {
          source("stockData.R");
          stockData(input$caption, "1999/1/1", Sys.Date()) 
        }, 
	  "Stock Stochastic Oscillator" = {
          source("stockData.R");
          stockData(input$caption, "1999/1/1", Sys.Date()) 
        }, 
	  "Stock Analysis Summary" = {
          source("stockData.R");
          stockData(input$caption, "1999/1/1", Sys.Date()) 
        },
	  "Stock Kalman Filter Prediction" = {
          source("stockData.R");
          stockData(input$caption, "1999/1/1", Sys.Date()) 
        }
                   )
    
  })
  
  output$caption <- renderText( {
    print(paste("Today's Date:  ", format(Sys.Date(), "%D")))
  })
  
  output$view <- renderTable({
    dataset <- datasetInput()
    num <- input$numDays
    switch(input$dataset,
           "Stock Quote" = {
             print(dataset)
             },
           
           "Stock Forecast" = {
             source("stockForcast.R")
             print(stockForcast(dataset))
           },
           "Stock Simple Moving Averages" = {
             source("movingAverage.R")
             print(movingAverage(dataset, num))
           },
           "Stock Accumulation Distribution Line" = {
             source("stockADLtable.R")
             print(stockADLtable(dataset, num))

	     },

	     "Stock Average Directional Index" = {
             source("stockADXtable.R")
             print(stockADXtable(dataset, num))

	     },
 		"Stock Aroon Indicator" = {
             source("stockAroontable.R")
             print(stockAroontable(dataset, num))

		},

		"Stock Moving Average Convergence Divergence" = {
             source("stockMACDtable.R")
             print(stockMACDtable(dataset, num))
		},  
	     "Stock On Balance Volume" = {
             source("stockOBVtable.R")
             print(stockOBVtable(dataset, num))

	     },

		"Stock Relative Strength Index" = {
             source("stockRSItable.R")
             print(stockRSItable(dataset, num))
		},
 		"Stock Stochastic Oscillator" = {
             source("stockStochOstable.R")
             print(stockStochOstable(dataset, num))
		}, 
	      "Stock Analysis Summary" = {
             source("stockSummarytable.R");
             print(stockSummarytable(dataset, num))
            }, 
	      "Stock Kalman Filter Prediction" = {
             source("kfRun.R");
             print(kfRun(dataset))
            }
 
    )
    
  })
 
  output$plot <- renderPlot({
    dataset <- datasetInput()
    num <- input$numDays
    switch(input$dataset,
           "Stock Simple Moving Averages" = {
             source("movingAveragePlot.R")
             print(movingAveragePlot(dataset, num))
           },
           "Stock Forecast" = {
             source("stockForcastPlot.R")
             print(stockForcastPlot(dataset, num))
           },  
	     "Stock On Balance Volume" = {
             source("stockOBV.R")
             print(stockOBV(dataset, num))

	     },
           "Stock Accumulation Distribution Line" = {
             source("stockADL.R")
             print(stockADL(dataset, num))

	     },

	     "Stock Average Directional Index" = {
             source("stockADX.R")
             print(stockADX(dataset, num))

	     },
 		"Stock Aroon Indicator" = {
             source("stockAroon.R")
             print(stockAroon(dataset, num))

		},

		"Stock Moving Average Convergence Divergence" = {
             source("stockMACD.R")
             print(stockMACD(dataset, num))
		},

		"Stock Relative Strength Index" = {
             source("stockRSI.R")
             print(stockRSI(dataset, num))
		},
 		"Stock Stochastic Oscillator" = {
             source("stockStochOs.R")
             print(stockStochOs(dataset, num))
 		}, 
		"Stock Analysis Summary" = {
		  source("movingAveragePlot.R")
		  print(movingAveragePlot(dataset, num))
		}, 
		"Stock Kalman Filter Prediction" = {
		  source("kfPlot.R")
		  print(kfPlot(dataset, num))
		}

    )
    
  }) 
  })