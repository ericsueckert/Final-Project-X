# Require packages
library(shiny)
library(dplyr)
library(plotly)
library(rsconnect)
source('scripts/build_map.r')

newdata<- read.csv("data/Summarized data.csv")

shinyServer(function(input, output, session) {
  output$Home <- renderText({
    readLines("scripts/index.html")  
  })
  # Render plotly
  output$mapPlot <- renderPlotly({
    build_map(newdata)
  })  
})
