# Require packages
library(shiny)
library(dplyr)
library(plotly)
library(rsconnect)

newdata<- read.csv("data/Summarized data.csv")

shinyServer(function(input, output) {
  # Render plotly
  output$mapPlot <- renderPlotly({
    m <- list(
      colorbar = list(title = "Admission Rate"),
      size = 5, opacity = 0.8, symbol = 'circle')
    
    newdata$hover <- paste(newdata$INSTNM, "has", newdata$ADM_RATE, "percent of admission rate", 
                           '<br>', "Location:",newdata$CITY, newdata$ZIP)
    
    g <- list(
      scope = 'usa',
      projection = list(type = 'albers usa'),
      showland = TRUE,
      landcolor = toRGB("gray95"),
      subunitcolor = toRGB("gray85"),
      countrycolor = toRGB("gray85"),
      countrywidth = 0.5,
      subunitwidth = 0.5)
    
    plot_ly(add, lat = LATITUDE, lon = LONGITUDE, text = hover, color = 'ADM_RATE',
            type = 'scattergeo', locationmode = 'USA-states', mode = "markers", marker = m) %>%
      
      layout(title = "US College Cards", geo = g)
  })
})