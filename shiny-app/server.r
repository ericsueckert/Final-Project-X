# Require packages
library(shiny)
library(dplyr)
library(plotly)
library(rsconnect)
source('scripts/build_map.r')

setwd("/Users/Potato/Documents/info498/Final-Project-X/shiny-app")
df<- read.csv("data/Summarized data.csv")

# Generate vectors detailing the columns that should be selected from the data set
nameIndex = which(colnames(df) == "INSTNM")
rateIndex = which(colnames(df) == "ADM_RATE")

shinyServer(function(input, output, session) {
  output$Home <- renderText({
    readLines("scripts/index.html")  
  })
  # Render map plotly
  output$mapPlot <- renderPlotly({
    build_map(df)
  })
  
  # Create the output for the SAT Plot data
  output$satPlot = renderPlotly({
    
    # Set the plot title
    titleText = "SAT"
    
    satData = which(colnames(thisData) == paste0(input$satSubject, input$satPercentile))
    satVector = c(nameIndex, satData, rateIndex)
    satPlotData = thisData[satVector]
    
    # Plot the data concerning the SAT selection
    plot = plot_ly(data = satPlotData,
                   title = "SAT Quartile Distribution",
                   x = satPlotData[[2]],
                   y = satPlotData[[3]], 
                   mode = "markers",
                   color = ADM_RATE)
  })
  
  # Create the output the ACT Plot data
  
  output$actPlot = renderPlotly({
    
    titleText = "ACT"
    
    # Get the columns for the desired data
    actData = which(colnames(thisData) == paste0(input$actSubject, input$actPercentile))
    
    actVector = c(nameIndex, actData, rateIndex)
    
    # Will select the data based on the rateIndexarameters
    actPlotData = thisData[actVector]
    
    # Plot the data concerning the ACT selection
    plot = plot_ly(data = actPlotData,
                   title = "ACT Quartile Distribution",
                   x = actPlotData[[2]],
                   y = actPlotData[[3]], 
                   mode = "markers",
                   color = ADM_RATE)
  })
})
