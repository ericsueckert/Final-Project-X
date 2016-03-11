# Require packages
library(shiny)
library(dplyr)
library(plotly)
library(rsconnect)

source('scripts/build_map.r')
source('scripts/plotScript.R')
source("scripts/summary-info.r")
source("scripts/build_map2.r")

df<- read.csv("data/Summarized data.csv")

shinyServer(function(input, output, session) {
  
  textstuff <- renderPrint({ "foo" })
    
  
  output$mapPlot <- renderPlotly({
    build_map(df)
  })
  
  # Create the output for the SAT Plot data
  output$satPlot = renderPlotly({
    dotPlotOutput(df,"SAT",paste0(input$satSubject, input$satPercentile))
  })
  
  # Create the output for choropleth map
  output$Choropleth <- renderPlotly({
    build_new_map(data_for_map, input$ADM_Score)
  })
  
  
  # Create the output the ACT Plot data
  
  output$actPlot = renderPlotly({
    dotPlotOutput(df,"ACT",paste0(input$actSubject, input$actPercentile))
  })
  
  output$table = renderDataTable(
    data_by_state
  )
  
  output$conversionTable = renderDataTable(
    score_chart
  )
  
})
