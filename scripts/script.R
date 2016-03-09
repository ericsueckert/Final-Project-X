# This file contains a script that allows for the construction of a plot

# Add the libraries used in this section of code
library(shiny)
library(dplyr)
library(plotly)
library(rsconnect)

setwd("C:/Users/Derek/Documents/INFO498F_HW/Final-Project-X/data")

thisData = read.csv("Summarized data.csv")

testingHistogram = function(dataset) {
  
}