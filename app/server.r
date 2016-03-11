# Require packages
library(shiny)
library(dplyr)
library(plotly)
library(rsconnect)
source('scripts/build_map.r')
source('scripts/plotScript.R')

df<- read.csv("data/Summarized data.csv")

shinyServer(function(input, output, session) {
#   output$Home <- renderText({
#     readLines("scripts/index.html")  
#   })
  # Render map plotly
  output$mapPlot <- renderPlotly({
    build_map(df)
  })
  
  # Create the output for the SAT Plot data
  output$satPlot = renderPlotly({
    dotPlotOutput(df,"SAT",paste0(input$satSubject, input$satPercentile))
  })
  
  # Create the output the ACT Plot data
  
  output$actPlot = renderPlotly({
    dotPlotOutput(df,"ACT",paste0(input$actSubject, input$actPercentile))
  })
})
