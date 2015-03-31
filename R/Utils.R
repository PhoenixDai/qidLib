setwd("/work/dir/ectory/")

fileList <- dir("../path/")

smpl$LOAD_DT <- format(as.Date(smpl$LOAD_DT), "%d-%b-%y")

smpl <- merge(binRst, clms, by="KEY")

str1==wtr2 #works
match(str1, str2) # works
substr(str1, start, end)

# get unique values of two factors
ECB_List <- unique(df$ECB_VFG)
PRED_List <- unique(df$Pred_VFG)
VFG_CD <- unique(unlist(list(ECB_List, PRED_List)))

# get common items of two factors
intersect(intersect(a,b),c)
Reduce(intersect,list(a,b,c))
