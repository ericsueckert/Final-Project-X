library(dplyr)
library(plotly)

setwd("/Users/Edward/Downloads")
setwd("/Users/Edward/Documents/Final-Project-X/data")

newdata<- read.csv("Summarized data.csv")
#data<- read.csv("Most+Recent+Cohorts+(All+Data+Elements).csv")

newdata<- data %>% filter() %>%
  select(UNITID, INSTNM, CITY, STABBR, ZIP, AccredAgency, INSTURL, NPCURL, main, LATITUDE, 
         LONGITUDE, ADM_RATE, SATVR25, SATVR75, SATMT25, SATMT75, SATWR25, SATWR75,
         SATVRMID,SATMTMID,SATWRMID, ACTCM25, ACTCM75, ACTEN25, ACTEN75, ACTMT25,
         ACTMT75, ACTWR25, ACTWR75, ACTCMMID, ACTENMID, ACTMTMID, ACTWRMID, SAT_AVG,
         COSTT4_A, TUITIONFEE_IN, TUITIONFEE_OUT, UGDS_WHITE, UGDS_HISP, UGDS_BLACK,
         UGDS_ASIAN)


write.csv(newdata, "Summarized data.csv")


##how to put known 1st, 2nd, 3rd quantile into map? or let R knows that they are quantiles???
as.data.frame(newdata)
is.data.frame(newdata)

add<- newdata

build_map<- function(add){
  g <- list(
    scope = 'usa',
    projection = list(type = 'albers usa'),
    showland = TRUE,
    landcolor = toRGB("gray85"),
    subunitwidth = 1,
    countrywidth = 1,
    subunitcolor = toRGB("white"),
    countrycolor = toRGB("white")
  )
  newdata$hover <- paste(newdata$INSTNM, "has", newdata$ADM_RATE, "percent", 
                       '< br>', "Location:",newdata$CITY, newdata$ZIP)
  
  plot_ly(newdata, lon = LONGITUDE, lat = LATITUDE, text = hover,  color = q, 
          type = 'scattergeo', locationmode = 'USA-states') %>%
    layout(title = 'United States College Information', geo = g)
}
