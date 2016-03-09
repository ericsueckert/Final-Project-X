# Require packages
library(shiny)
library(plotly)

shinyUI(navbarPage("ACT and SAT scores!",
                   
                   tabPanel("Home",
                            fluidPage(
                              htmlOutput('Home')
                            )
                            
                           # sidebarLayout(
                            #  sidebarPanel(
                                # parameters
                             # ),
                             # mainPanel(
                             #   # something pretty
                             # )
                           # )
                   ),
                   
                   tabPanel("Map",
                            sidebarLayout(
                              sidebarPanel(
                                # map parameters
                              ),
                              mainPanel(
                                plotlyOutput("mapPlot")
                              )
                            )
                   ),
                   tabPanel("Histogram",
                            sidebarLayout(
                              sidebarPanel(
                                # hist parameters
                              ),
                              mainPanel(
                                # plotOutput("histPlot")
                              )
                            )
                   ),
                   tabPanel("FAQ",
                            sidebarLayout(
                              sidebarPanel(
                                
                              ),
                              mainPanel(
                                
                              )
                            )
                   ),
                   tabPanel("Reference",
                            sidebarLayout(
                              sidebarPanel(
                                
                              ),
                              mainPanel(
                                
                              )
                            )
                   )
))
