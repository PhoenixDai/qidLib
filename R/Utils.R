smpl$LOAD_DT <- format(as.Date(smpl$LOAD_DT), "%d-%b-%y")

smpl <- merge(binRst, clms, by="KEY")