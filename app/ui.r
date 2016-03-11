# Require packages
library(shiny)
library(plotly)

shinyUI(navbarPage("ACT and SAT scores!",
                   
                   tabPanel("Home",
                            sidebarLayout(
                              sidebarPanel(
                                img(src='SAT-Subject-Tests-And-College-Board.jpg', height = 250, width = 250)
                              ),
                              mainPanel(
                                includeMarkdown("scripts/index.Rmd")
                              )#,
                              #position = c("left", "right"),
                              #fluid = TRUE
                            )
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
                   
                   tabPanel("Choropleth Map",
                            sidebarLayout(
                              sidebarPanel(
                                selectInput("ADM_Score", label = h3("Choose SAT Score or Admission Rate"), 
                                            choices = list("Average SAT Score" = 'Average_SAT_Score', "Average Admission Rate" = 'Average_Acceptance_Rate'), 
                                            selected = 'Average_SAT_Score')
                                            ),
                            
                              mainPanel(
                                plotlyOutput("Choropleth")
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
                                img(src='collegeBoard_logo.jpeg', height = 250, width = 250)
                              ),
                              mainPanel(
                                includeMarkdown("scripts/FAQ.Rmd")
                              )
                            )
                   ),
                   tabPanel("Reference",
                            sidebarLayout(
                              sidebarPanel(
                                img(src='ACT_logo.png ', height = 250, width = 250),
                                img(src='SAT-Logo.png', height = 250, width = 250)
                              ),
                              mainPanel(
                                includeMarkdown("scripts/reference.Rmd"),
                                dataTableOutput("conversionTable")
                              )
                            )
                   ),
                   tabPanel("Admission statistics",
                            sidebarLayout(
                              sidebarPanel(
                                img(src='College_logo.jpg', height = 500, width = 250)
                              ),
                            
                              mainPanel(
                                print(h3("State data: ")),
                                dataTableOutput("table")
                              )
                            )
                            )
))
