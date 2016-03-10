# Require packages
library(shiny)
library(dplyr)
library(plotly)
library(rsconnect)
source('scripts/build_map.r')
source('scripts/plotScript.R')

# setwd("/Users/Potato/Documents/info498/Final-Project-X/shiny-app")
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
    dotPlotOutput("SAT", input$satSubject, input$satPercentile)
  })
  
  # Create the output the ACT Plot data
  
  output$actPlot = renderPlotly({
    dotPlotOutput("ACT", input$actSubject, input$actPercentile)
  })
})
