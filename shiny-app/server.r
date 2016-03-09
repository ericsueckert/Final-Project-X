# Require packages
library(shiny)
library(dplyr)
library(plotly)
library(rsconnect)
source('scripts/build_map.r')

setwd("/Users/Potato/Documents/info498/Final-Project-X/shiny-app")
df<- read.csv("data/Summarized data.csv")

shinyServer(function(input, output, session) {
  output$Home <- renderText({
    readLines("scripts/index.html")  
  })
  # Render map plotly
  output$mapPlot <- renderPlotly({
    build_map(df)
  })  
})
