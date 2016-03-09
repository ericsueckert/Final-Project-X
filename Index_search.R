library(plotly)
library(dplyr)

########################################################################################################
###### Do not use this to make a Shiny app, I'm still testing this one, some problems need to fix. #####
########################################################################################################

setwd("/Users/Edward/Documents/Final-Project-X/data")
read.csv("summarized data.csv")
View(newdata)

college<- function(name) {
  newdata%>%
    filter()%>%
    select(INSTNM, contains = 'name')
}