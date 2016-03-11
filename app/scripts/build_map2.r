# Build a choropleth map

# df <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/2014_world_gdp_with_codes.csv')
   library(plotly)
 library(shiny)
library(dplyr)
source("scripts/summary-info.r")

  build_new_map <- function(df, column) {
       df$hover <- with(df, paste(STABBR, '<br>', "SAT Score", Average_SAT_Score, "ADM Rate", Average_Acceptance_Rate))
      
        
       # give state boundaries a white border
        l <- list(color = toRGB("white"), width = 2)
        
          # specify some map projection/options
          g <- list(
             scope = 'usa',
              projection = list(type = 'albers usa'),
              showlakes = TRUE,
              lakecolor = toRGB('white')
            )
          
           plot_ly(df, z = eval(parse(text = column)), #text = hover,
                               locations = STABBR, 
                                type = 'choropleth',
                                locationmode = 'USA-states', 
                                color = eval(parse(text = column)), 
                                colors = 'Purples',
                                marker = list(line = l), 
                                colorbar = list(title = "Score/percentage")) %>%
              layout(title = 'US College Statistics', geo = g) %>% 
              return()
        }