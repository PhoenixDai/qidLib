fileConn<-file("file.txt", open="w")
outStr <- "foo bar bla"
writeLines(outStr, fileConn)
close(fileConn)

CCC_splstr <- substr(CCC_splstr, 3, nchar(CCC_splstr))

df = read.csv(file="file.csv")
write.csv(df, file="file.csv")
