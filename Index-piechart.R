library(plotly)
library(dplyr)

########################################################################################################
###### Do not use this to make a Shiny app, I'm still testing this one, some problems need to fix. #####
########################################################################################################

setwd("/Users/Edward/Documents/Final-Project-X/data")
read.csv("summarized data.csv")
View(newdata)

newdata$UGDS_HISP <- as.numeric(as.character(newdata$UGDS_HISP))
newdata$UGDS_WHITE<- as.numeric(as.character(newdata$UGDS_WHITE))
newdata$UGDS_BLACK<- as.numeric(as.character(newdata$UGDS_BLACK))
newdata$UGDS_ASIAN<- as.numeric(as.character(newdata$UGDS_ASIAN))


sum_hisp<- sum(newdata$UGDS_HISP)
sum_white<- sum(newdata$UGDS_WHITE)
sum_black<- sum(newdata$UGDS_BLACK)
sum_asian<- sum(newdata$UGDS_ASIAN)

ds <- data.frame(labels = c("White students percentage","Black students percentage",
                            "Hispanic students percentage","Asian students percentage"),
                 values = c('sum_white', 'sum_black', 'sum_hisp', 'sum_asian'))

plot_ly(ds, labels = labels, values = values, type = "pie") %>% 
  layout(title = "Basic Pie Chart using Plotly")