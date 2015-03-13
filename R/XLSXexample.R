options(java.parameters = "-Xmx16g" ) 

library(XLConnect) 
wb <- loadWorkbook("F3.xlsx") 
df <- readWorksheet(wb, sheet="Sheet1", header = TRUE)
