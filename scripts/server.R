# This contains the server R file for the shiny application used in the final project.

# Apply the relevant packages
library("shiny")
library("dplyr")
library("plotly")

setwd("C:/Users/Derek/Documents/INFO498F_HW/Final-Project-X/data")


shinyServer(function(input, output) {
  
  # Create the output function for rendering the iris data
  output$iris_plot = renderPlotly({
    
  })
})