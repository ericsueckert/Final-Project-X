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
                   tabPanel("ACT and SAT Plots",
                            # Apply the title panel
                            titlePanel("SAT and ACT scores"),
                            
                            sidebarLayout(
                              sidebarPanel(
                                # Createa a check group that shows which species should be shown on the display
                                checkboxGroupInput("actPercentile", label = h3("Select ACT Percentile"), 
                                                   choices = list("25th Percentile" = "75", "Mid Percentile" = "MID", "75th Percentile" = "75"),
                                                   selected = "MID"
                                ),
                                
                                # Select the variable that will be used on the x axis 
                                selectInput("actSubject", label = h3("Select ACT Subject"), 
                                            choices = list("English" = "ACTEN", "Writing" = "ACTWR",
                                                           "Math" = "ACTMT", "Cumulative" = "ACTCM"), 
                                            selected = "ACTEN"
                                ),
                                
                                # Input line break
                                hr(),
                                
                                checkboxGroupInput("satPercentile", label = h3("Select SAT Percentile"), 
                                                   choices = list("25th Percentile" = "75", "Mid Percentile" = "MID", "75th Percentile" = "75"),
                                                   selected = "MID"
                                ),
                                
                                # Select the variable that will be used on the y axis 
                                selectInput("satSubject", label = h3("Select SAT Subject"), 
                                            choices = list("Reading" = "SATVR", "Writing" = "SATWR",
                                                           "Math" = "SATMT"), 
                                            selected = "SATVR"),
                                
                                # Input line break
                                hr()
                              ),
                              mainPanel(
                                plotlyOutput("actPlot"),
                                hr(),
                                plotlyOutput("satPlot")
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
