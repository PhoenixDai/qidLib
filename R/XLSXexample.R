options(java.parameters = "-Xmx16g" ) 

library(XLConnect) 

# read sheet
wb <- loadWorkbook("F3.xlsx") 
df <- readWorksheet(wb, sheet="Sheet1", header = TRUE)

# write sheet
wbo <- loadWorkbook("F3_out.xlsx", create = TRUE)
createSheet(wbo, name = "F3")
writeWorksheet(wbo, rst, sheet="F3")
saveWorkbook(wbo)
