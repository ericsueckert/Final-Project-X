# Require packages
library(shiny)
library(plotly)

shinyUI(navbarPage("ACT and SAT scores!",
                   
  # Summary tab
  tabPanel("Home",
           # The markdown file goes here
           fluidPage(
             htmlOutput('instructions')
           ) 
          
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
