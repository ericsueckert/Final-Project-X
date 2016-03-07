# This is a script for creating histograms 

# Include relevant packages
library("dplyr")
library("plotly")
library("shiny")
library("ggplot2")

# Set the 
setwd("C:/Users/Derek/Documents/INFO498F_HW/Final-Project-X/data")

shinyUI(fluidPage(
  # Apply the title panel
  titlePanel("Info 498 F Final Project"),
  
  # Implement the side bar and side panel
  sidebarLayout(
    
    # Position the side bar to be on the left
    position = "left",
    
    
    # Display the output of the server
    outputPlotly("")
  )
  
))