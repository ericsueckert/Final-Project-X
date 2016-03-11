# This provides code that produces the various SAT and ACT plots

dotPlotOutput = function(dataFrame, test, target) {
  
  # Generate vectors detailing the columns that should be selected from the data set
  nameIndex = which(colnames(dataFrame) == "INSTNM")
  rateIndex = which(colnames(dataFrame) == "ADM_RATE")
  
  # Set the plot title
  titleText = test
  
  testData = which(colnames(dataFrame) == target)
  selectedCol = c(nameIndex, testData, rateIndex)
  PlotData = dataFrame[selectedCol]
  
  # Set the font type for labels
  fontSet <- list(
    family = "Courier New, monospace",
    size = 18,
    color = "#7f7f7f"
  )
  
  # Set the x and y axis labels
  xList = list(title = "Score", titlefont = fontSet)
  yList = list(title = "Admittance Rate", titlefont = fontSet)
  
  # Plot the data concerning the SAT selection
  plot = plot_ly(data = PlotData,
                 title = paste0(test, " Quartile Distribution"),
                 x = PlotData[[2]],
                 y = PlotData[[3]], 
                 mode = "markers",
                 color = ADM_RATE)
  
  # Set the title text for the plots
  titleText = paste(test, " Score vs Admittance statistics")
  
  # Apply the layout parameters
  layout(plot, xaxis = xList, yaxis = yList, title = titleText)
  
  return(plot)
}