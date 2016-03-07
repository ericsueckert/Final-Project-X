# Require packages
library(shiny)
library(plotly)

shinyUI(navbarPage("ACT and SAT scores!",
                   
  # Summary tab
  tabPanel("Summary"
           # put summary info here
           ),
  
  # Map tab
  tabPanel("Map",
           sidebarLayout(
             sidebarPanel(
               # map parameters go here
             )
           ),
           mainPanel(
             plotOutput("mapPlot")
           )
           ),
  
  # Hist tab
  tabPanel("Histogram",
           sidebarLayout(
             sidebarPanel(
               # histogram parameters go here
             )
           ),
           mainPanel(
             plotOutput("histPlot")
           )
           )
))
