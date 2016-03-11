library(dplyr)
library(plotly)

setwd("/Users/Edward/Documents/Final-Project-X/shiny-app/data")


#data<- read.csv("Most+Recent+Cohorts+(All+Data+Elements).csv")
## url: "https://catalog.data.gov/dataset/college-scorecard/resource/4a18482a-8617-4bf9-8c37-0da0aa2ac3f8"

newdata<- data %>% filter() %>%
  select(UNITID, INSTNM, CITY, STABBR, ZIP, AccredAgency, INSTURL, NPCURL, main, LATITUDE, 
         LONGITUDE, ADM_RATE, SATVR25, SATVR75, SATMT25, SATMT75, SATWR25, SATWR75,
         SATVRMID,SATMTMID,SATWRMID, ACTCM25, ACTCM75, ACTEN25, ACTEN75, ACTMT25,
         ACTMT75, ACTWR25, ACTWR75, ACTCMMID, ACTENMID, ACTMTMID, ACTWRMID, SAT_AVG,
         COSTT4_A, TUITIONFEE_IN, TUITIONFEE_OUT, UGDS_WHITE, UGDS_HISP, UGDS_BLACK,
         UGDS_ASIAN)

write.csv(newdata, "Summarized data.csv")

newdata<- read.csv("Summarized data.csv")
##how to put known 1st, 2nd, 3rd quantile into map? or let R knows that they are quantiles???

add = newdata

  
newdata$hover <- paste(newdata$INSTNM, "has", newdata$ADM_RATE * 100, "percent of admission rate", 
                        '<br>', "Location:",newdata$CITY, newdata$ZIP)  
  
cols <- RColorBrewer::brewer.pal(3, "Set1")

newdata$ADM_RATE <- as.numeric(as.character(newdata$ADM_RATE))

newdata$SAT_AVG<- as.numeric(as.character(newdata$SAT_AVG))


build_map<- function(add, lower_SAT, upper_SAT){
  
#state_fun<- add%>% 
  #          filter(STABBR == states)

final_data<- add %>%
            filter( upper_SAT >= SAT_AVG) %>%
            filter( lower_SAT <= SAT_AVG) %>%
            select(INSTNM, LATITUDE, LONGITUDE, ADM_RATE, hover)

  m <- list(
    colorbar = list(title = "Admission Rate"),
    size = 5, opacity = 0.5, symbol = 'circle')

  g <- list(
    scope = 'usa',
    projection = list(type = 'albers usa'),
    showland = TRUE,
    landcolor = toRGB("gray95"),
    subunitcolor = toRGB("gray85"),
    countrycolor = toRGB("gray85"),
    countrywidth = 0.5,
    subunitwidth = 0.5)
  
  plot_ly(
  final_data, 
    lat = LATITUDE,
    lon = LONGITUDE, 
          text = hover, 
          colors = cols, 
          color = ADM_RATE * 100, 
          opacity = 0.5, na.rm = TRUE, 
          type = 'scattergeo', 
          locationmode = 'USA-states', 
          size = ADM_RATE, 
          mode = "markers", 
          marker = m) %>%
    layout(title = "US College Cards", geo = g)
}
