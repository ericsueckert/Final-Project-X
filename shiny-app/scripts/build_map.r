# Create a function that builds a map
# Require Packages
library(dplyr)
library(plotly)

build_map <- function(df) {
  
  m <- list(
    colorbar = list(title = "Admission Rate"),
    size = 5, opacity = 0.8, symbol = 'circle')
  
  df$hover <- paste(df$INSTNM, "has", df$ADM_RATE, "percent of admission rate", 
                    '<br>', "Location:",df$CITY, df$ZIP)
  
  g <- list(
    scope = 'usa',
    projection = list(type = 'albers usa'),
    showland = TRUE,
    landcolor = toRGB("gray95"),
    subunitcolor = toRGB("gray85"),
    countrycolor = toRGB("gray85"),
    countrywidth = 0.5,
    subunitwidth = 0.5)
  
  p <- plot_ly(df, lat = LATITUDE, lon = LONGITUDE, text = hover, color = ADM_RATE,
               type = 'scattergeo', locationmode = 'USA-states', mode = "markers", marker = m)
  
  layout(p, title = "US College Cards", geo = g) %>% 
  return()

}