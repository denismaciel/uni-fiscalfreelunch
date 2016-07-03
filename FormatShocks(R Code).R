getwd()
setwd("/Users/denismaciel/Documents/fiscalfreelunch")

df <- read.csv("denis.csv")

j <- c()
for (i in 1:nrow(df)) {
  j <- paste0(j, ",","'",  df[i,] ,"'")
}
j

k <- c()
for (i in 1:nrow(df)) {
  k <- paste0(k, ",",  df[i,])
}
k
