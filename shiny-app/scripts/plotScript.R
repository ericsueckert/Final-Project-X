# This provides code that produces the various SAT and ACT plots

dotPlotOutput = function(test, sub, percent) {
  # Set the plot title
  titleText = test
  
  testData = which(colnames(df) == paste0(sub, percent))
  Vector = c(nameIndex, testData, rateIndex)
  PlotData = df[Vector]
  
  # Plot the data concerning the SAT selection
  plot = plot_ly(data = PlotData,
                 title = paste0(test, " Quartile Distribution"),
                 x = satPlotData[[2]],
                 y = satPlotData[[3]], 
                 mode = "markers",
                 color = ADM_RATE)
  
  return(plot)
}