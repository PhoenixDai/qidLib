# trim a string
trim <- function (x) gsub("^\\s+|\\s+$", "", x)

# find sub string in a string
if(grepl("ab", "aacabd")) print("found") else print("not found")

# string compare
str1==wtr2 #works
match(str1, str2) # works

# get sub string
substr(str1, start, end)
